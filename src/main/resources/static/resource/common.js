$('select[data-value]').each(function(index, item){
	console.log(index);
	console.log(item);
	
	const items = $(item);
	console.log(items);
	
	const defaultValue = items.attr('data-value').trim();
	console.log(defaultValue);
	
	if(defaultValue.length > 0){
		items.val(defaultValue);
	}
	console.log(items);
	
})