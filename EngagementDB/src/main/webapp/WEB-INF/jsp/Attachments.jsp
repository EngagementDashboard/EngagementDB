<!doctype html>
<html>
<head>
<title>Attachments</title>
<style>
    #selectedFiles img {
        max-width: 125px;
        max-height: 125px;
        float: left;
        margin-bottom:10px;
    }
</style>
</head>
   
<body>
 
<div align="center">
<form action="storeAttachments.htm" method="post" enctype="multipart/form-data">
<!-- <br><br>File Name: <input type="text" name="fileName" id="fileName" size=50>
<br><br>
File Details:<input type="text" name="filedeatils" id="filedeatils" size=50><br>
<br><br> -->


<b>Files-Upload:</b> <input type="file" id="file" name="fileData" multiple accept="image/*">
<!-- <b> Folder-Upload:</b><input type="file" name="files[]" id="files" multiple="" directory="" webkitdirectory="" mozdirectory=""> -->

<input type="submit" value="upload"></p>

</form>
</div>
</body>
</html>
