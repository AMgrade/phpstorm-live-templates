String filename = _editor.getVirtualFile()
    .getNameWithoutExtension()
    .replaceAll(/([A-Z])/, /_$1/)
    .toLowerCase()
    .replaceAll(/^_/, "")

if (filename.endsWith("es")) {
    return filename;
}

if (filename.endsWith("is")) {
    return filename.replaceFirst("is\$", "es");
}

if (filename.endsWith("y")) {
    return filename.replaceFirst("y\$", "ies");
}

if (
    filename.endsWith("ch") ||
    filename.endsWith("x") ||
    filename.endsWith("sh") ||
    filename.endsWith("s") ||
    filename.endsWith("o")
) {
    return filename + "es";
}

return filename + "s";
