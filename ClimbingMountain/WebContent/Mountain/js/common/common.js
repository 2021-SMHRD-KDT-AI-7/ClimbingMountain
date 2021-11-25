/* file upload 함수 */
function uploadAttachFiles(formData,callbackFunction){
	$.ajax({
           	type: "POST",
            enctype: 'multipart/form-data',
            url: "/upload",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (response) {
            	callbackFunction(response);
            },
            error: function (e) {
                console.log("ERROR : ", e);
               
            }
	});
}

$(document).ready(function() {
    $("#files").on("change", addFiles);
});

var filesTempArr = [];

function addFiles(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    var filesArrLen = filesArr.length;
    var filesTempArrLen = filesTempArr.length;
    for( var i=0; i<filesArrLen; i++ ) {
        filesTempArr.push(filesArr[i]);
        $("#fileList").append(
                "<span class='file-down'><span>" + filesArr[i].name + "</span> " + 
                "<a href='#;' class=\"xi-close\" onclick=\"deleteFile(event, " + (filesTempArrLen+i)+ ");\"></a></span>"
        );
    }
    $(this).val('');
}

function deleteFile (eventParam, orderParam) {
    filesTempArr.splice(orderParam, 1);
    var innerHtmlTemp = "";
    var filesTempArrLen = filesTempArr.length;
    for(var i=0; i<filesTempArrLen; i++) {
        //innerHtmlTemp += "<div>" + filesTempArr[i].name + " <a href=\"\" onclick=\"deleteFile(event, " + i + ");\">X</a></div>"
        innerHtmlTemp += "<span class='file-down'><span>" + filesTempArr[i].name + "</span> " + 
        "<a href='#;' class=\"xi-close\" onclick=\"deleteFile(event, " + i + ");\"></a></span>" ;
    }
    $("#fileList").html(innerHtmlTemp);
}