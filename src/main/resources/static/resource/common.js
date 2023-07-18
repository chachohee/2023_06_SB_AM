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


$('.modal-exam').click(function(){
//	$('.layer-bg').show();
//	$('.layer').show();

	$('.layer-bg, .layer').css('display', 'block');
})

$('#closeBtn').click(function(){
//	$('.layer-bg').hide();
//	$('.layer').hide();

	$('.layer-bg, .layer').css('display', 'none');
})

$('.close-x-btn').click(function(){
//	$('.layer-bg').hide();
//	$('.layer').hide();

	$('.layer-bg, .layer').css('display', 'none');
})

$('.layer-bg').click(function(){
//	$('.layer-bg').hide();
//	$('.layer').hide();

	$('.layer-bg, .layer').css('display', 'none');
})