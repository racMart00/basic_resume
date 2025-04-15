import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HireMeButton(),
        const SizedBox(width: 10),
        CallToActionButton(
          title: 'My Work',
          color: Theme.of(context).colorScheme.inverseSurface,
          textColor: Theme.of(context).colorScheme.surface,
          onPressed: () {
            context.go('/2');
          },
        ),
      ],
    );
  }
}

class _HireMeButton extends StatefulWidget {
  @override
  State<_HireMeButton> createState() => _HireMeButtonState();
}

class _HireMeButtonState extends State<_HireMeButton> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showPopup() {
    final renderBox =
        _buttonKey.currentContext!.findRenderObject()! as RenderBox;

    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: ModalBarrier(
              color: Colors.transparent,
              onDismiss: _removePopup,
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy - 60,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'racmart00@gmail.com',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayMedium!.fontSize,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, color: Colors.white),
                      onPressed: () {
                        Clipboard.setData(
                          const ClipboardData(text: 'racmart00@gmail.com'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,
                            content: Text(
                              'Email copied to clipboard',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        );
                        _removePopup();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CallToActionButton(
      key: _buttonKey,
      title: 'Hire Me',
      color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
      textColor: Colors.white,
      onPressed: () {
        if (_overlayEntry == null) {
          _showPopup();
        } else {
          _removePopup();
        }
      },
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    required this.color,
    required this.title,
    required this.textColor,
    required this.onPressed,
    super.key,
  });

  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
