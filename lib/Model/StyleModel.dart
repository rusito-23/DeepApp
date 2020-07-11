

/// Style Model
///
/// Saves style configuration
class StyleModel {
    /// Visual name
    String name;
    // Visual description
    String description;
    /// API Path
    String path;
    /// Local icon path
    String iconPath;

    StyleModel(String name, String description, String path, String iconPath) {
        this.name = name;
        this.description = description;
        this.path = path;
        this.iconPath = iconPath;
    }
}
