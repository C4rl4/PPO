

'use strict'
let photo = document.getElementById('imgphoto');
let file = document.getElementById('flimage');

photo.addEventListener('click', () => {
	file.click();
});

file.addEventListener('change', (event) => {
	let reader = new FileReader();
	reader.onload = () => {
		photo.src=reader.result;
	}
	
	reader.readAsDataURL(file.files[0]);
});