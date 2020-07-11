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
                    'assets/icons/painting.jpeg');
    }

    static StyleModel textureStyle() {
        return StyleModel(
                    'Texture',
                    'Trippy with some texture changes.',
                    'texture',
                    'assets/icons/texture.jpeg');
    }

    static StyleModel trippyStyle() {
        return StyleModel(
                    'Trippy',
                    'Trippy effect.',
                    'trippy',
                    'assets/icons/trippy.jpeg');
    }

    static StyleModel sydBarrettStyle() {
        return StyleModel(
                    'Syd Barrett',
                    'Too trippy and weird.',
                    'barret',
                    'assets/icons/barret.jpeg');
    }

    static StyleModel whatEverStyle() {
        return StyleModel(
                    'Whatever',
                    'Whatever, just for fun.',
                    'whatever',
                    'assets/icons/whatever.jpeg');
    }

}
