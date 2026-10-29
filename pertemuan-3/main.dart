

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eksplorasi Text Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TextExplorationScreen(),
    );
  }
}

class TextExplorationScreen extends StatelessWidget {
  const TextExplorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Text Widget - Commit 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '1. Font, Weight, dan Style',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FontTextWidget(),
            Divider(height: 40),

            Text(
              '2. Spacing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SpacingTextWidget(),
            Divider(height: 40),

            Text(
              '3. Decoration dan Shadow',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DecorationTextWidget(),
          ],
        ),
      ),
    );
  }
}



class FontTextWidget extends StatelessWidget {
  const FontTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Normal', style: TextStyle(fontSize: 20)),
        Text(
          'Bold',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Semi Bold',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Italic',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class SpacingTextWidget extends StatelessWidget {
  const SpacingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Letter Spacing',
          style: TextStyle(fontSize: 20, letterSpacing: 5),
        ),
        SizedBox(height: 10),
        Text(
          'Word Spacing Example',
          style: TextStyle(fontSize: 20, wordSpacing: 10),
        ),
        SizedBox(height: 10),
        Text(
          'Line 1\nLine 2\nLine 3 (Height 1.5)',
          style: TextStyle(fontSize: 20, height: 1.5),
        ),
      ],
    );
  }
}

class DecorationTextWidget extends StatelessWidget {
  const DecorationTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Underline',
          style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
        ),
        SizedBox(height: 10),
        Text(
          'Line Through',
          style: TextStyle(
            fontSize: 20,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Background Color',
          style: TextStyle(fontSize: 20, backgroundColor: Colors.yellow),
        ),
        SizedBox(height: 10),
        Text(
          'Text Shadow',
          style: TextStyle(
            fontSize: 20,
            shadows: [
              Shadow(offset: Offset(2, 2), blurRadius: 3, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
