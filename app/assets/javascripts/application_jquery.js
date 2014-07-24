function add_fields(link, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + "g")
  $(link).parent().before(content.replace(regexp, new_id));
}