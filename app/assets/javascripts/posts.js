var loadFile = event => {
  var output = document.getElementById('image-preview')
  output.src = URL.createObjectURL(event.target.files[0])
}
