import '../Model/StyleModel.dart';


/// Style Provider
///
/// Handles the styles listing.
class StyleProvider {

    static List<StyleModel> getStyles() {
        return <StyleModel>[
            StyleProvider.paintingStyle(),
            StyleProvider.textureStyle(),
            StyleProvider.trippyStyle(),
            StyleProvider.sydBarrettStyle(),
            StyleProvider.whatEverStyle(),
        ];
    }

    static StyleModel paintingStyle() {
        return StyleModel(
                    'Painting',
                    'Painting simil effect.',
                    'painting',
                    'icon');
    }

    static StyleModel textureStyle() {
        return StyleModel(
                    'Texture',
                    'Trippy with some texture changes.',
                    'texture',
                    'icon');
    }

    static StyleModel trippyStyle() {
        return StyleModel(
                    'Trippy',
                    'Trippy effect.',
                    'trippy',
                    'icon');
    }

    static StyleModel sydBarrettStyle() {
        return StyleModel(
                    'Syd Barrett',
                    'Too trippy and weird.',
                    'barret',
                    'icon');
    }

    static StyleModel whatEverStyle() {
        return StyleModel(
                    'Whatever',
                    'Whatever, just for fun.',
                    'whatever',
                    'icon');
    }

}
