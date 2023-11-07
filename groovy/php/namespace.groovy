String filePath = _editor.getVirtualFile()
    .getPath()
    .replace(_editor.getProject().getBaseDir().getPath(), "");

filePath = filePath.substring(0, filePath.lastIndexOf("/"));
filePath = filePath.replace("/", "\\");
filePath = filePath.substring(1);
filePath = filePath.capitalize();

return filePath;
