//custom js for the content tree in the CMS

$(document).ready(function(){

    $("li.tree-item span").droppable({
        tolerance        : "touch",
        hoverClass       : "tree-hover",
        drop             : function(event, ui){
            var dropped = ui.draggable;
            dropped.css({top: 0, left: 0});
            var me = $(this).parent();
            if(me == dropped)
                return;
            var subbranch = $(me).children("ul");
            if(subbranch.size() == 0) {
                me.find("span").after("<ul></ul>");
                subbranch = me.find("ul");
            }
            var oldParent = dropped.parent();
            subbranch.eq(0).append(dropped);
            var oldBranches = $("li", oldParent);
            var newParent = me.attr('id')
            var child = dropped.attr('id')
            $.post("/admin/inkling/update_tree", {new_parent: newParent, child: child});
        }
    });

    $("li.tree-item").draggable({
        opacity: 0.5,
        revert: true
    });

    $(".toggle_content_tree").live("click", function(){
        $(this).parent().children(".content_tree").toggle();
    })

    $(".toggle_content_form").live("click", function(){
        $(this).parent().children(".content_form").toggle();
    })

}); 

function submitForm(selectElement){
	if (selectElement.options[selectElement.selectedIndex].value == "")
		return;
	
	selectElement.form.submit();
}

//requests specified path to controller#action for a content object
function getOperation(selectElement){
	var path = selectElement.options[selectElement.selectedIndex].value
	if (path == "")
		return;	
	document.location = path;
}

