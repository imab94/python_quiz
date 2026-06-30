class TopicSection {
  final String title;
  final String content;

  final String? syntax;
  final String? exampleCode;
  final String? output;

  const TopicSection({
    required this.title,
    required this.content,
    this.syntax,
    this.exampleCode,
    this.output,
  });
}