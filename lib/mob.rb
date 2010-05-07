# Copyright, unless specified otherwise in a particular licensing agreement, belongs to Tree Falling In The Woods, Pty Ltd.
# See http://treefallinginthewoods.com

module Mob

  def clean_mob_method(method, word)
     statement = method.to_s.gsub("#{word}_",'')
     statement.gsub!('?', '')
     return statement
  end

  module Permissable
    include Mob
     #checks for a .can_ call on permissions. Only users and roles are permissable
     def method_missing(method, *args, &block)
       if method.to_s.split(/_/)[0].to_s == "can"
         return can(method)
       end

       super(method, *args, &block)
     end

     def can(method)
       statement = clean_mob_method(method, 'can')

       perm = Permission.find_by_name(statement)
       return perm.users.include?(self)
     end
  end

  module Identifiable
    include Mob

     def method_missing(method, *args, &block)
       if method.to_s.split(/_/)[0].to_s == "is"
         return is(method)
       end

       super(method, *args, &block)
     end

     def is(method)
       statement = clean_mob_method(method, 'is')
       role = Role.find_by_name(statement)

       if role.nil?
         return false
       end

       if role == self.role
         return true
       elsif role
         return false
       else
        raise "No such role #{statement}", MobError, caller
       end
     end
  end

  require 'digest/sha1'
  class User < ActiveRecord::Base
    include Mob::Identifiable, Mob::Permissable

    attr_accessor :password
    attr_accessor :confirmation_password

    belongs_to :role

    validates_uniqueness_of :display_name

    validates_length_of :display_name, :maximum => 40
    validates_length_of :given_name, :maximum => 40, :if => Proc.new {|u| u.given_name}
    validates_length_of :family_name, :maximum => 40, :if => Proc.new {|u| u.family_name}
    validates_length_of :email, :maximum => 60

    validates_presence_of :email
    validates_presence_of :display_name


    def validate
      if new_record? && password && confirmation_password
        if !(password === confirmation_password)
          self.errors.add("Passwords are not identical.")
        end
      elsif new_record? && active
        self.errors.add("Creating a user without a password and setting the active field to true")
      else
        #it's not a new record, so we have to deal with password reseting
        if active && !(password === confirmation_password)
          self.errors.add("Passwords are not identical.")
        end
      end

      return true
    end

   # Authenticates a user by their email address and unencrypted password.  Returns the user or nil.
    def self.authenticate(email, password)
      u = find_by_email(email) # need to get the salt
     # debugger
      u && u.authenticated?(password) ? u : nil
    end

    # Encrypts some data with the salt.
    def self.encrypt(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def reset_password!()
      plain = plain_random_password()
      self.password = plain
      self.confirmation_password = plain
      self.active = false
      self.save!
      return plain
    end

    def activate_with_new_password!(passwd, confirmation_passwd)
      if passwd === confirmation_passwd
        self.password = passwd
        self.confirmation_password = confirmation_passwd
        self.encrypt_password
        self.active = true
        self.save
      else
        self.errors.add("Passwords are not identical.")
      end
    end

    def in?(role)
      return self.role == role
    end

    # Encrypts the password with the user salt
    def encrypt(password)
      self.class.encrypt(password, salt)
    end

    def authenticated?(password)
      crypted_password == encrypt(password)
    end

    def is_anonymous?
      false
    end

    def ==(other)
      unless other.is_a?(User) then return false end

      return self.id == other.id
    end

   #This should be called externally, because RO allows the creation of users
   #with blank passwords (as long as the active field
   #is set to false), we no longer call this internally.
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
      self.crypted_password = encrypt(password)
    end

    private
    def plain_random_password()
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      limit = 6 + rand(4)
      1.upto(limit) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
  end

  class Role < ActiveRecord::Base
      include Mob::Permissable

    has_many :users, :through => :memberships, :source => :user
    validates_uniqueness_of :name

    alias members users

    def member?(user)
      return members.include?(user)
    end

     def remove(user)
       user.role_id = nil
       user.save
     end

    def <<(user)
      if members.include?(user) then return end

      user.role = self
    end

    alias add <<

    def ==(other)
      unless other.is_a?(Role) then return false end

      return other.id == self.id
    end
  end


  class AnonymousUser

  attr_accessor :ip

    def initialize(ip = nil, cookies = nil)
      # debugger
      @ip = ip
      cookies[:last_logged] = DateTime.now.to_s
    end

    def display_name
      "Anonymous"
    end

    alias name display_name

    def is_anonymous?
      true
    end

    def is_known?
      false
    end

  def is(role_name)
    false
  end

  def method_missing(method, *args, &block)
    case method.to_s.split(/_/)[0]
      when "can"
        return false
      when "is"
        return false
      when "in"
        return false
      else
        super(method, *args, &block)
    end
  end
end

  class MobError < StandardError
  end
end
