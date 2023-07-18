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

$('.popUp-exam').click(function(){
	let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
	let openUrl = '/usr/home/popUp';
	window.open(openUrl, 'pop', popOption);
})