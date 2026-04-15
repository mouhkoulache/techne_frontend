import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../widgets/shared.dart';
void main() => runApp(const TechneApp());

class TechneApp extends StatelessWidget {
  const TechneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        textTheme: GoogleFonts.newsreaderTextTheme(),
      ),
      home: const TechneLandingPage(),
    );
  }
}

// --- GLOBAL STYLES ---
const Color primaryGreen = Color(0xFF3E4531);
const Color accentPeach = Color(0xFFF3C3B2);
const Color accentSage = Color(0xFFCFD6C4);
const Color accentBeige = Color(0xFFF5F0E6);
const Color cream = Color(0xFFFDFBF7);
const Color accentApricot = Color(0xFFFDE8D3);
const Color accentCoral = Color(0xFFF3C3B2);
const Color beige = Color(0xFFF5F2EA);
const Color apricot = Color(0xFFFDE8D3);

// --- 1. LANDING PAGE (RE-FIXED) ---
class TechneLandingPage extends StatelessWidget {
  const TechneLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        title: Text('Techne', 
          style: GoogleFonts.newsreader(fontSize: 24, fontWeight: FontWeight.bold, color: primaryGreen)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&q=80&w=1000'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: accentSage.withOpacity(0.9), borderRadius: BorderRadius.circular(20)),
                    child: const Text('COMMUNITY HUB', style: TextStyle(color: primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text('Master Every Dimension of Skill',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.newsreader(fontSize: 36, fontWeight: FontWeight.bold, color: primaryGreen, height: 1.1)),
                  const SizedBox(height: 12),
                  Container(height: 4, width: 48, decoration: BoxDecoration(color: accentPeach, borderRadius: BorderRadius.circular(10))),
                  const SizedBox(height: 16),
                  const Text('From traditional pottery to modern programming, Techne is where artisans and professionals evolve together.',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black87)),
                ],
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildCategory('Soft Skills', Icons.psychology),
                  _buildCategory('Hard Skills', Icons.terminal),
                  _buildCategory('Crafts', Icons.brush),
                  _buildCategory('Leadership', Icons.leaderboard),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen, foregroundColor: cream,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Get Started', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                    style: TextButton.styleFrom(
                      backgroundColor: accentPeach.withOpacity(0.4), foregroundColor: primaryGreen,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Log In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: accentSage.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: Column(
                children: [
                  Text('The Techne Method', style: GoogleFonts.newsreader(fontSize: 20, fontWeight: FontWeight.bold, color: primaryGreen)),
                  const SizedBox(height: 40),
                  _buildPillar(Icons.auto_stories, 'Foundational Knowledge', 'Deep dives into theory.'),
                  const SizedBox(height: 24),
                  _buildPillar(Icons.handshake, 'Collaborative Mentorship', 'Direct feedback from masters.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String t, IconData i) => Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(children: [
      Container(width: 64, height: 64, decoration: BoxDecoration(color: accentPeach.withOpacity(0.2), borderRadius: BorderRadius.circular(16)), child: Icon(i, color: primaryGreen)),
      const SizedBox(height: 8), Text(t.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey))
    ]),
  );

  Widget _buildPillar(IconData i, String t, String s) => Row(children: [
    CircleAvatar(backgroundColor: primaryGreen, child: Icon(i, color: cream, size: 20)),
    const SizedBox(width: 16),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryGreen)),
      Text(s, style: const TextStyle(color: Colors.black54, fontSize: 13)),
    ]))
  ]);
}

// --- 2. LOGIN PAGE (Fixes Overflow) ---
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: primaryGreen), onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent,
                title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: primaryGreen,
          ),
        ),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView( 
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome Back', style: GoogleFonts.newsreader(fontSize: 40, fontWeight: FontWeight.bold, color: primaryGreen)),
                  const SizedBox(height: 8),
                  const Text('Good to see you again. Please enter your details.', 
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54)),
                  const SizedBox(height: 40),
                  _inputField('Email', 'name@example.com'),
                  const SizedBox(height: 20),
                  _inputField('Password', '••••••••', isPassword: true, showForgot: true),
                  const SizedBox(height: 32),
                  _primaryBtn('Sign In',context),
                  _divider('Or continue with'),
                  _socialRow(),
                  const SizedBox(height: 40),
                  _footerLink(context, "Don't have an account? ", "Sign Up", const SignUpPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- 3. CREATE ACCOUNT PAGE (Fixed Missing Details) ---
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: primaryGreen), onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent,
                title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: primaryGreen,
          ),
        ),
              centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Join Techne', style: GoogleFonts.newsreader(fontSize: 40, fontWeight: FontWeight.bold, color: primaryGreen)),
                  const SizedBox(height: 8),
                  const Text('Start your creative journey today.', 
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 40),
                  _inputField('Full Name', 'koulache amine'),
                  const SizedBox(height: 20),
                  _inputField('Email Address', 'amine@example.com'),
                  const SizedBox(height: 20),
                  _inputField('Password', 'Min. 8 characters', isPassword: true),
                  const SizedBox(height: 32),
                   ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                       context,
                        MaterialPageRoute(builder: (context) => SkillsSelectionPage()),
                        );
                      },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen, 
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('create account', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
            
                  _divider('Or sign up with'),
                  _socialRow(),
                  const SizedBox(height: 40),
                  _footerLink(context, "Already have an account? ", "Log In", const LoginPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget _inputField(String label, String hint, {bool isPassword = false, bool showForgot = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryGreen)),
          if (showForgot) TextButton(onPressed: () {}, child: const Text('Forgot Password?', style: TextStyle(color: primaryGreen, fontSize: 12))),
        ],
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isPassword ? const Icon(Icons.visibility_outlined, color: accentPeach) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: accentSage)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: accentSage)),
        ),
      ),
    ],
  );
}
Widget _primaryBtn(String label, BuildContext context) { 
  return ElevatedButton(
    onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const UserHomeScreen()),
        (route) => false, 
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryGreen, 
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Text(
      label, 
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
  );
}

Widget _divider(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Row(children: [
      const Expanded(child: Divider(color: accentSage)),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text(label, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey))),
      const Expanded(child: Divider(color: accentSage)),
    ]),
  );
}

Widget _socialRow() {
  return Row(children: [
    Expanded(child: _socialBtn('Google', FontAwesomeIcons.google, Colors.redAccent)),
    const SizedBox(width: 16),
    Expanded(child: _socialBtn('Apple', FontAwesomeIcons.apple, Colors.black)),
  ]);
}

Widget _socialBtn(String label, IconData icon, Color color) {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: FaIcon(icon, color: color, size: 18),
    label: Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      backgroundColor: accentBeige.withOpacity(0.3),
      side: const BorderSide(color: accentSage),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

Widget _footerLink(BuildContext context, String text, String linkText, Widget target) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => target)),
          child: Text(linkText, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryGreen, decoration: TextDecoration.underline)),
        ),
      ],
    ),
  );
}

//4 skills selections page
class SkillsSelectionPage extends StatefulWidget {
  const SkillsSelectionPage({super.key});

  @override
  State<SkillsSelectionPage> createState() => _SkillsSelectionPageState();
}

class _SkillsSelectionPageState extends State<SkillsSelectionPage> {

  final Set<String> _selectedSkills = {'Pottery'}; 


  final List<Map<String, dynamic>> _skills = [
    {'title': 'Programming', 'subtitle': 'Tech & Logic', 'icon': Icons.code},
    {'title': 'Graphic Design', 'subtitle': 'Visual Identity', 'icon': Icons.brush},
    {'title': 'Cooking', 'subtitle': 'Culinary Arts', 'icon': Icons.restaurant},
    {'title': 'Leadership', 'subtitle': 'Team & Strategy', 'icon': Icons.groups},
    {'title': 'Communication', 'subtitle': 'Interpersonal', 'icon': Icons.forum},
    {'title': 'Pottery', 'subtitle': 'Wheel & Hand', 'icon': Icons.local_florist},
    {'title': 'Knitting', 'subtitle': 'Fiber Arts', 'icon': Icons.gesture},
    {'title': 'Woodworking', 'subtitle': 'Carpentry', 'icon': Icons.handyman},
  ];

  void _toggleSkill(String title) {
    setState(() {
      if (_selectedSkills.contains(title)) {
        _selectedSkills.remove(title);
      } else {
        _selectedSkills.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: primaryGreen,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(4, (index) {

      bool isCurrentStep = index == 0;
      bool isCompleted = index < 0;
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,

        width: isCurrentStep ? 32 : 8, 
        decoration: BoxDecoration(

          color: (isCurrentStep || isCompleted) ? primaryGreen : accentApricot,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }),
  ),
),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'What skills are you cultivating?',
                          style: GoogleFonts.newsreader(fontSize: 32, fontWeight: FontWeight.bold, color: primaryGreen, height: 1.1),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _skills.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.9,
                          ),
                          itemBuilder: (context, index) {
                            final skill = _skills[index];
                            final isSelected = _selectedSkills.contains(skill['title']);
                            
                            return GestureDetector(
                              onTap: () => _toggleSkill(skill['title']),
                              child: _buildSkillCard(
                                skill['title'], 
                                skill['subtitle'], 
                                skill['icon'], 
                                isSelected
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 140),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              decoration: BoxDecoration(
                color: cream,
                border: Border(top: BorderSide(color: accentPeach.withOpacity(0.2), width: 2)),
              ),
                  child:ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GoalsSelectionPage()),
                      );
                    },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      foregroundColor: accentApricot,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                   child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        'Continue',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 20),
                   ],
                 ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String title, String subtitle, IconData icon, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? accentSage.withOpacity(0.2) : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? primaryGreen : accentSage,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: isSelected ? primaryGreen : accentPeach, size: 32),
              if (isSelected) const Icon(Icons.check_circle, color: primaryGreen, size: 20),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryGreen)),
              Text(subtitle, style: TextStyle(fontSize: 13, color: primaryGreen.withOpacity(0.6))),
            ],
          ),
        ],
      ),
    );
  }
}

//5 your goals page
class GoalsSelectionPage extends StatefulWidget { 
  const GoalsSelectionPage({super.key});

  @override
  State<GoalsSelectionPage> createState() => _GoalsSelectionPageState();
}
class _GoalsSelectionPageState extends State<GoalsSelectionPage> {

  final Set<String> _selectedGoals = {'Learn new skills'};
  final List<Map<String, dynamic>> _goalOptions = [
    {
      'title': 'Learn new skills',
      'icon': Icons.school,
      'bgColor': accentApricot.withOpacity(0.3)
    },
    {
      'title': 'Find local workshops',
      'icon': Icons.event_available,
      'bgColor': accentSage.withOpacity(0.2)
    },
    {
      'title': 'Buy unique templates',
      'icon': Icons.shopping_bag,
      'bgColor': accentApricot.withOpacity(0.3)
    },
    {
      'title': 'Start selling my crafts',
      'icon': Icons.storefront,
      'bgColor': accentSage.withOpacity(0.2)
    },
    {
      'title': 'Connect with other makers',
      'icon': Icons.group,
      'bgColor': accentApricot.withOpacity(0.3)
    },
  ];

  void _toggleGoal(String title) {
    setState(() {
      if (_selectedGoals.contains(title)) {
        _selectedGoals.remove(title);
      } else {
        _selectedGoals.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryGreen,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ExperienceLevelPage())),
            child: const Text('Skip', 
              style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(4, (index) {
      bool isCurrentStep = index == 1;
      bool isCompleted = index < 1;
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: isCurrentStep ? 32 : 8, 
        decoration: BoxDecoration(
          color: (isCurrentStep || isCompleted) ? primaryGreen : accentApricot,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }),
  ),
),
                  Text(
                    'Your Goals',
                    style: GoogleFonts.newsreader(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'What is your primary goal on Techne? Select all that apply to personalize your experience.',
                    style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 24),

                  ..._goalOptions.map((goal) {
                    final isSelected = _selectedGoals.contains(goal['title']);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        onTap: () => _toggleGoal(goal['title']),
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: goal['bgColor'],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? primaryGreen : Colors.black.withOpacity(0.05),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(goal['icon'], color: accentCoral, size: 28),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  goal['title'],
                                  style: GoogleFonts.newsreader(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: primaryGreen,
                                  ),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: isSelected ? primaryGreen : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: primaryGreen.withOpacity(0.3),
                                    width: isSelected ? 0 : 2,
                                  ),
                                ),
                                child: isSelected 
                                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                                  : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 100), 
                ],
              ),
            ),
          ),
        ],
      ),


      bottomNavigationBar: Container(
        color: cream,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ExperienceLevelPage())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      foregroundColor: accentApricot,
                      disabledBackgroundColor: primaryGreen.withOpacity(0.6),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    child: const Text('Continue', 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'You can always change these preferences later in your settings.',
                    style: TextStyle(fontSize: 11, color: Colors.black38, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//6 ExperienceLevelPage
class ExperienceLevelPage extends StatefulWidget {
  const ExperienceLevelPage({super.key});

  @override
  State<ExperienceLevelPage> createState() => _ExperienceLevelPageState();
}

class _ExperienceLevelPageState extends State<ExperienceLevelPage> {

  String _selectedLevel = 'Curious Beginner';

  final List<Map<String, String>> _levels = [
    {
      'title': 'Curious Beginner',
      'subtitle': 'Just starting out or exploring new crafts',
      'icon': 'school'
    },
    {
      'title': 'Hobbyist',
      'subtitle': 'Enjoy crafting regularly as a creative outlet',
      'icon': 'brush'
    },
    {
      'title': 'Intermediate',
      'subtitle': 'Consistent practice with a solid set of skills',
      'icon': 'architecture'
    },
    {
      'title': 'Advanced/Professional',
      'subtitle': 'High-level mastery or making a living from crafts',
      'icon': 'workspace_premium'
    },
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'school': return Icons.school;
      case 'brush': return Icons.brush;
      case 'architecture': return Icons.architecture;
      case 'workspace_premium': return Icons.workspace_premium;
      default: return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: beige.withOpacity(0.5),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryGreen,
          ),
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: primaryGreen.withOpacity(0.1))),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(4, (index) {
      bool isCurrentStep = index == 2;
      bool isCompleted = index < 2;
      
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: isCurrentStep ? 32 : 8, 
        decoration: BoxDecoration(

          color: (isCurrentStep || isCompleted) ? primaryGreen : accentApricot,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }),
  ),
),
                  const SizedBox(height: 32),

                  Text(
                    'Experience Level',
                    style: GoogleFonts.newsreader(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tell us about your craft expertise to personalize your feed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: primaryGreen.withOpacity(0.7)),
                  ),

                  const SizedBox(height: 32),

                  ..._levels.map((level) {
                    final isSelected = _selectedLevel == level['title'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () => setState(() => _selectedLevel = level['title']!),
                        borderRadius: BorderRadius.circular(12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? primaryGreen : accentApricot,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? primaryGreen : primaryGreen.withOpacity(0.2),
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                            color: primaryGreen,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(level['title']!,
                                        style: GoogleFonts.newsreader(
                                            fontSize: 18, fontWeight: FontWeight.bold, color: primaryGreen)),
                                    Text(level['subtitle']!,
                                        style: TextStyle(fontSize: 14, color: primaryGreen.withOpacity(0.6))),
                                  ],
                                ),
                              ),
                              Icon(
                                _getIcon(level['icon']!),
                                color: isSelected ? primaryGreen : accentPeach,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            decoration: BoxDecoration(
              color: cream.withOpacity(0.8),
            ),
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PathSelectionPage())),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: accentSage, 
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 8,
                shadowColor: primaryGreen.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Continue', 
                    style: GoogleFonts.newsreader(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 7-PathSelectionPage
class PathSelectionPage extends StatefulWidget {
  const PathSelectionPage({super.key});

  @override
  State<PathSelectionPage> createState() => _PathSelectionPageState();
}

class _PathSelectionPageState extends State<PathSelectionPage> {
  String _selectedPath = 'Learner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Techne',
          style: GoogleFonts.newsreader(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryGreen,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                bool isLast = index == 4;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: isLast ? 32 : 8, 
                  decoration: BoxDecoration(
                    color: isLast ? primaryGreen : accentApricot,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'How will you use Techne?',
                    style: GoogleFonts.newsreader(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Select the profile type that best describes your goals. You can explore both sides later.',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryGreen.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),

                  _buildPathCard(
                    title: 'Learner',
                    description: 'Discover new hobbies, book workshops, and learn from experts.',
                    icon: Icons.auto_stories,
                    isSelected: _selectedPath == 'Learner',
                  ),
                  const SizedBox(height: 16),
                  _buildPathCard(
                    title: 'Creator',
                    description: 'Share your skills, sell lessons, and build your creative business.',
                    icon: Icons.brush,
                    isSelected: _selectedPath == 'Creator',
                  ),

                  const SizedBox(height: 40),
                  Opacity(
                    opacity: 0.3,
                    child: Row(
                      children: List.generate(
                        30,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : accentSage,
                            height: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_selectedPath == 'Learner') {
      
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const UserHomeScreen()));
                    } else {
      
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                   },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: accentApricot,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 8,
                    shadowColor: primaryGreen.withOpacity(0.4),
                  ),
                  child: const Text(
                    'Start My Journey',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'By finishing, you agree to our Terms of Service',
                  style: TextStyle(
                    fontSize: 13,
                    color: primaryGreen.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathCard({
    required String title,
    required String description,
    required IconData icon,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _selectedPath = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? cream : cream.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryGreen : accentSage,
            width: 2,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: primaryGreen.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentPeach.withOpacity(isSelected ? 0.2 : 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: isSelected ? accentPeach : primaryGreen.withOpacity(0.4), size: 28),
                ),

                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? primaryGreen : accentSage,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(color: primaryGreen, shape: BoxShape.circle),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.newsreader(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isSelected ? primaryGreen : primaryGreen.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? primaryGreen.withOpacity(0.7) : primaryGreen.withOpacity(0.5),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// 8 User home screen
class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This list holds the actual screens. 
    // Since you mentioned they exist, ensure you have imported them.
    final List<Widget> pages = [
      _buildHomeContent(), 
      const ExploreScreen(), 
      const LibraryPage(), 
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: cream,
      appBar: _buildAppBar(),
      // IndexedStack keeps the state of all pages alive so they don't reset
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- HOME CONTENT ---
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          _buildCategoryChips(),
          _buildSectionHeader('Featured Pathways'),
          _buildFeaturedScroll(),
          _buildLiveExperiences(),
          _buildSectionHeader('Learning Kits'),
          _buildLearningKits(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // --- APP BAR ---
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: cream.withOpacity(0.8),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          const Icon(Icons.architecture, color: accentPeach, size: 30),
          const SizedBox(width: 8),
          Text(
            'Techne',
            style: GoogleFonts.newsreader(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: primaryGreen),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 16, left: 8),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: accentSage,
            child: Icon(Icons.person, color: primaryGreen, size: 20),
          ),
        ),
      ],
    );
  }

  // --- SEARCH & CHIPS ---
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search skills, workshops, or mentors',
          hintStyle: TextStyle(color: primaryGreen.withOpacity(0.4)),
          prefixIcon: const Icon(Icons.search, color: primaryGreen),
          filled: true,
          fillColor: accentSage.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['All Skills', 'Programming', 'Leadership', 'Pottery', 'Design'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isFirst = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: Chip(
              backgroundColor: isFirst ? primaryGreen : accentSage.withOpacity(0.3),
              label: Text(
                categories[index],
                style: TextStyle(
                  color: isFirst ? Colors.white : primaryGreen,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }

  // --- SECTION HELPERS ---
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.newsreader(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
          const Text(
            'See all',
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedScroll() {
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildPathwayCard('Mastering the Pottery Wheel', '12 Lessons • 4.5 Hours', '6,500 DZD', 'Artisan', Icons.gesture),
          _buildPathwayCard('Python for Modern Web', '24 Lessons • 18 Hours', '12,000 DZD', 'Tech', Icons.code),
        ],
      ),
    );
  }

  Widget _buildPathwayCard(String title, String sub, String price, String badge, IconData icon) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryGreen.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Center(child: Icon(icon, size: 60, color: primaryGreen.withOpacity(0.2))),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: accentSage, borderRadius: BorderRadius.circular(4)),
                    child: Text(badge, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryGreen)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(sub, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryGreen)),
                    const Row(
                      children: [
                        Icon(Icons.star, color: accentPeach, size: 14),
                        Text(' 4.9', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLiveExperiences() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: accentSage.withOpacity(0.1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Live Experiences', style: GoogleFonts.newsreader(fontSize: 24, fontWeight: FontWeight.bold, color: primaryGreen)),
                const Row(
                  children: [
                    Icon(Icons.location_on, color: accentPeach, size: 16),
                    Text(' Algiers, DZ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryGreen)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildLiveTile('Leadership Intensive', 'Sunday, Oct 20 • 10:00 AM', '5,500 DZD', Icons.groups),
          _buildLiveTile('Casbah Sketching Walk', 'Friday, Oct 18 • 4:00 PM', '2,500 DZD', Icons.brush),
        ],
      ),
    );
  }

  Widget _buildLiveTile(String title, String time, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            height: 70, width: 70,
            decoration: BoxDecoration(color: accentSage.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: primaryGreen),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryGreen)),
              const SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  minimumSize: const Size(0, 24),
                  shape: const StadiumBorder(),
                ),
                child: const Text('BOOK', style: TextStyle(fontSize: 10, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLearningKits() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.75,
      children: [
        _buildKitCard('Web Starter Shell Scripts', 'Code • 1,200 DZD', Icons.terminal),
        _buildKitCard('Workshop Space Planner', 'PDF • 900 DZD', Icons.architecture),
      ],
    );
  }

  Widget _buildKitCard(String title, String detail, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: accentPeach.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: primaryGreen.withOpacity(0.4), size: 40),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Row(
          children: [
            const Icon(Icons.description, color: accentPeach, size: 14),
            Text(' $detail', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryGreen)),
          ],
        )
      ],
    );
  }

  // --- NAVIGATION BAR ---
  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: cream.withOpacity(0.95),
        border: Border(top: BorderSide(color: primaryGreen.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.explore_outlined, 'Explore', 1),
          _buildNavItem(Icons.local_library_outlined, 'Library', 2),
          _buildNavItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index; // This will update the IndexedStack!
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isActive ? accentSage.withOpacity(0.3) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isActive ? primaryGreen : primaryGreen.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: primaryGreen,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
class TechneColors {
  static const Color primary = Color(0xFF3E4531);        // Deep Forest Green
  static const Color accentSage = Color(0xFFCFD6C4);     // Sage
  static const Color cream = Color(0xFFFDFBF7);          // Cream
  static const Color beige = Color(0xFFF5F0E6);          // Beige
  static const Color accentPeach = Color(0xFFF3C3B2);    // Peach Accent
  static const Color backgroundLight = Color(0xFFFDFBF7);
}


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechneColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: TechneColors.accentPeach),
                  Text(
                    'Techne',
                    style: GoogleFonts.newsreader(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: TechneColors.primary,
                    ),
                  ),
                  const SizedBox(width: 24), // Spacer for balance
                ],
              ),
            ),

            // --- SEARCH BAR ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: TechneColors.accentSage.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search skills, workshops...",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: TechneColors.accentPeach),
                  ),
                ),
              ),
            ),

            // --- CATEGORY CHIPS ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildChip("All", isActive: true),
                  _buildChip("Coding"),
                  _buildChip("Crafts"),
                  _buildChip("Soft Skills"),
                ],
              ),
            ),

            // --- SEARCH RESULTS LIST ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SEARCH RESULTS",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.black45)),
                      Text("3 found",
                          style: TextStyle(fontSize: 10, color: Colors.black45)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCourseCard(
                    title: "Python for Beginners",
                    price: "4,500 DZD",
                    author: "Code Academy",
                    tag: "LESSON",
                    icon: Icons.play_circle_outline,
                    info: "128 Lessons • On-Demand",
                    imageUrl: "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=2070",
                  ),
                  _buildCourseCard(
                    title: "Effective Public Speaking",
                    price: "8,200 DZD",
                    author: "Sarah Jenkins",
                    tag: "WORKSHOP",
                    icon: Icons.calendar_today,
                    info: "Live Session • Nov 15",
                    imageUrl: "https://images.unsplash.com/photo-1475721027785-f74eccf877e2?q=80&w=2070",
                  ),
                  _buildCourseCard(
                    title: "Advanced Hand-Built Pottery",
                    price: "15,000 DZD",
                    author: "Elena Rodriguez",
                    tag: "MASTERCLASS",
                    icon: Icons.location_on_outlined,
                    info: "Portland Studio • Sat, Oct 12",
                    imageUrl: "https://images.unsplash.com/photo-1565191999001-551c187427bb?q=80&w=2070",
                  ),
                  const SizedBox(height: 80), // Space for nav bar
                ],
              ),
            ),
          ],
        ),
      ),
      
      // --- BOTTOM NAVIGATION ---

    );
  }

  // --- HELPER BUILDERS ---

  Widget _buildChip(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? TechneColors.primary : TechneColors.accentSage.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : TechneColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String price,
    required String author,
    required String tag,
    required String info,
    required IconData icon,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: TechneColors.accentSage.withOpacity(0.9), borderRadius: BorderRadius.circular(4)),
                  child: Text(tag, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: TechneColors.primary)),
                ),
              ),
              const Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.favorite, color: TechneColors.accentPeach, size: 18),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: GoogleFonts.newsreader(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: TechneColors.primary)),
                  ],
                ),
                Text("by $author", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(icon, size: 14, color: TechneColors.accentPeach),
                    const SizedBox(width: 4),
                    Text(info, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black54)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }



}
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Editorial Header
            Text(
              'Curated Collection',
              style: GoogleFonts.newsreader(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: primaryGreen,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your personal archive of artisanal knowledge, upcoming masterclasses, and precision-engineered templates.',
              style: TextStyle(
                fontSize: 16,
                color: primaryGreen.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            // Custom Tabs
            Row(
              children: [
                _buildTab('Lessons', true),
                const SizedBox(width: 24),
                _buildTab('Workshops', false),
                const SizedBox(width: 24),
                _buildTab('Templates', false),
              ],
            ),
            const Divider(height: 1, thickness: 0.5),
            const SizedBox(height: 32),

            // Featured Card (Willow Weaving)
            _buildFeaturedCard(),
            const SizedBox(height: 24),

            // Next Step Card
            _buildNextStepCard(context),
            const SizedBox(height: 32),

            // Grid Items (Modern Calligraphy & Sourdough)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildGridItem('Modern Calligraphy', '24 Modules • PDF', Icons.edit_note, true)),
                const SizedBox(width: 16),
                Expanded(child: _buildGridItem('Sourdough Science', 'Live Workshop • Oct 12', Icons.bakery_dining, false)),
              ],
            ),
            const SizedBox(height: 24),

            // Discover More Card
            _buildDiscoverCard(),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: active ? const Border(bottom: BorderSide(color: primaryGreen, width: 2)) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          color: active ? primaryGreen : primaryGreen.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primaryGreen.withOpacity(0.1),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1583250780cf9-939e8020583b?q=80&w=600'), // Willow weaving placeholder
  
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16, right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.bookmark, color: accentPeach),
            ),
          ),
          Positioned(
            bottom: 20, left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('MASTERCLASS', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 2)),
                Text(
                  'The Art of Willow Weaving',
                  style: GoogleFonts.newsreader(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNextStepCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: apricot.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: accentPeach, size: 28),
          const SizedBox(height: 12),
          Text('Next Step', style: GoogleFonts.newsreader(fontSize: 22, fontStyle: FontStyle.italic, color: primaryGreen)),
          const SizedBox(height: 8),
          const Text('You have 4 lessons remaining in "Sustainable Pottery Glazing". Pick up where you left off?'),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LibraryPage2())),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Resume Learning'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, String sub, IconData icon, bool isWishlist) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: accentSage.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Center(child: Icon(icon, size: 40, color: primaryGreen.withOpacity(0.2))),
              if (isWishlist)
                Positioned(
                  top: 12, left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: apricot, borderRadius: BorderRadius.circular(20)),
                    child: const Text('Wishlist', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryGreen)),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(sub, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  Widget _buildDiscoverCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, color: accentPeach, size: 40),
          const SizedBox(height: 16),
          Text(
            'Discover More',
            style: GoogleFonts.newsreader(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Based on your saved items, you might enjoy "Bespoke Leather Crafting".',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: apricot,
              side: const BorderSide(color: apricot),
              shape: const StadiumBorder(),
            ),
            child: const Text('Explore Now'),
          )
        ],
      ),
    );
  }
}


class CSColors {
  // The Signature Covert Stitch Palette
  static const Color charcoal = Color(0xFF1A1A1A);  // Deep, near-black for text and primary UI
  static const Color crimson = Color(0xFFE63946);   // The accent red for buttons and progress
  static const Color slate = Color(0xFF2C2C2C);     // Secondary dark for cards or toggles
  static const Color lightGray = Color(0xFFF5F5F5); // Background for tiles
  static const Color muted = Color(0xFF9E9E9E);     // Subtitle text
  static const Color white = Colors.white;          // Primary background
}
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isArtisan = false;

  static const interests = [
    'Textiles', 'Bespoke Tailoring', 'Pattern Making',
    'Embroidery', 'Leatherwork', 'Sustainable Fashion',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CSColors.white,
      appBar: AppBar(
        backgroundColor: CSColors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: CSColors.charcoal),
        actions: [
          TextButton(
            onPressed: () => context.go('/artisan-profile/1'),
            child: Text(
              'BECOME A CREATOR',
              style: TextStyle(
                color: CSColors.crimson,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(height: 1, thickness: 1),
            _buildStats(),
            const Divider(height: 1, thickness: 1),
            _buildSectionHeader('MY JOURNEY', 'Active masterclasses'),
            _buildProgressList(),
            _buildSectionHeader('CREDENTIALS', 'Verified mastery'),
            _buildCertificates(),
            _buildModeSwitcher(),
            _buildInterests(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2.0, color: CSColors.charcoal)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: CSColors.muted, fontFamily: 'Georgia', fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: CSColors.charcoal,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Julian Thorne',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: CSColors.charcoal),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  color: CSColors.charcoal,
                  child: const Text('ELITE LEARNER', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return IntrinsicHeight(
      child: Row(
        children: [
          _StatItem(label: 'WORKSHOPS', value: '24'),
          const VerticalDivider(width: 1, thickness: 1),
          _StatItem(label: 'STITCH HOURS', value: '156'),
          const VerticalDivider(width: 1, thickness: 1),
          _StatItem(label: 'RANK', value: '#12'),
        ],
      ),
    );
  }

  Widget _buildProgressList() {
    return Column(
      children: [
        _CourseCard(
          title: 'Advanced Sashiko Techniques',
          progress: 0.78,
          image: 'https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=400',
        ),
        _CourseCard(
          title: 'Bespoke Suit Construction',
          progress: 0.42,
          image: 'https://images.unsplash.com/photo-1452860606245-08befc0ff44b?w=400',
        ),
      ],
    );
  }

  Widget _buildCertificates() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _CertTile(title: 'Master of Pattern Drafting', id: 'CS-9921'),
          const SizedBox(height: 12),
          _CertTile(title: 'Sustainable Dyeing Expert', id: 'CS-8840'),
        ],
      ),
    );
  }

  Widget _buildModeSwitcher() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CSColors.charcoal,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('THE CREATOR STUDIO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          const Text(
            'Ready to lead? Switch to Artisan mode to manage your workshops and students.',
            style: TextStyle(color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: CSColors.crimson,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('ACTIVATE ARTISAN MODE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildInterests() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: interests.map((tag) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: CSColors.charcoal.withOpacity(0.1)),
          ),
          child: Text(tag, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        )).toList(),
      ),
    );
  }
}

// ─── Refined Sub-widgets ──────────────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String label, value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: CSColors.muted, letterSpacing: 1.0)),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String title, image;
  final double progress;
  const _CourseCard({required this.title, required this.progress, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 70, height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(image: CachedNetworkImageProvider(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(height: 2, color: CSColors.lightGray),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(height: 2, color: CSColors.crimson),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('${(progress * 100).toInt()}% COMPLETE', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: CSColors.muted)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CertTile extends StatelessWidget {
  final String title, id;
  const _CertTile({required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CSColors.lightGray,
        border: Border(left: BorderSide(color: CSColors.charcoal, width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text('ID: $id', style: const TextStyle(fontSize: 10, color: CSColors.muted)),
            ],
          ),
          const Icon(Icons.verified_user, size: 20, color: CSColors.charcoal),
        ],
      ),
    );
  }
}














// CREATOR PAGES

class AppColors {
  static const Color primaryGreen = Color(0xFF3E4531);
  static const Color accentPeach = Color(0xFFF3C3B2);
  static const Color accentSage = Color(0xFFCFD6C4);
  static const Color accentBeige = Color(0xFFF5F0E6);
  static const Color cream = Color(0xFFFDFBF7);
  static const Color accentApricot = Color(0xFFFDE8D3);
  static const Color accentCoral = Color(0xFFF3C3B2);
  static const Color beige = Color(0xFFF5F2EA);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. THIS IS THE ONLY CURRENT_INDEX YOU NEED
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 2. DEFINE THE PAGES LIST
    // I used your _buildCreatorContent for the Home index
    final List<Widget> _pages = [
      _buildCreatorContent(),     // Index 0: Home
      const ExploreScreen(), // Index 1
      const LibraryPage(), // Index 2
      const CreatorProfilePage(), // Index 3: Profile (Elena Rossi page)
    ];

    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: buildBottomNavBar(),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
    );
  }

  // --- YOUR ORIGINAL UI CONTENT (Mapped to Home) ---
  Widget _buildCreatorContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildHeader(),
            const SizedBox(height: 20),
            buildTitle(),
            const SizedBox(height: 20),
            buildOptionCard(
              icon: Icons.video_call,
              title: "Online Lesson",
              subtitle: "Host a live or pre-recorded digital session for students globally",
              onTap: () => Navigator.pushNamed(context, '/online'),
            ),
            buildOptionCard(
              icon: Icons.groups,
              title: "In-Person Workshop",
              subtitle: "Organize a local event, hands-on class, or physical meetup",
             onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const WorkshopSetupPage(),
      fullscreenDialog: true, // This makes the "X" close button look better for forms
    ),
  );
},
            ),
            buildOptionCard(
              icon: Icons.description,
              title: "Downloadable Template",
              subtitle: "Sell digital patterns, guides, or instructional assets",
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ListTemplatePage(),
      fullscreenDialog: true, // This makes the "X" close button look better for forms
    ),
  );
},
            ),
            const SizedBox(height: 20),
            buildFooterBox(),
          ],
        ),
      ),
    );
  }

  // --- UI HELPER METHODS ---
  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        const Text(
          "Techne",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
        const Text(
          "Artisan",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget buildTitle() {
    return Column(
      children: [
        const Text(
          "Share your passion.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Select an option that suits your desires.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: AppColors.accentBeige,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: Icon(icon, color: AppColors.primaryGreen),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ),
    );
  }

  Widget buildFooterBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentSage,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "indecisive ? our creator guide is here to help !",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // --- WORKING NAVIGATION BAR ---
  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.beige,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex, 
      onTap: (index) {
        setState(() {
          _currentIndex = index; // This now navigates correctly
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Library"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}

//creator profile page
class CreatorProfilePage extends StatelessWidget {
  const CreatorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F4), // background-light
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildAppBar(),
                _buildHeroSection(),
                _buildTabBar(),
              ];
            },
            body: TabBarView(
              children: [
                _buildLessonsList(),
                const Center(child: Text("Workshops Content")),
                const Center(child: Text("Templates Content")),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFAB(),
  
      ),
    );
  }

  // --- TOP BAR ---
  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFFFFF8F4),
      floating: true,
      elevation: 0,
      leading: const Icon(Icons.menu, color: Color(0xFF3E4531)),
      centerTitle: true,
      title: Text(
        'Techne',
        style: GoogleFonts.newsreader(
          fontStyle: FontStyle.italic,
          fontSize: 24,
          color: const Color(0xFF3E4531),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF3E4531)),
              shape: const StadiumBorder(),
            ),
            child: Text(
              'Switch to Learner',
              style: GoogleFonts.newsreader(
                fontStyle: FontStyle.italic,
                color: const Color(0xFF3E4531),
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --- HERO SECTION ---
  SliverToBoxAdapter _buildHeroSection() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=150'),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3E4531),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.check, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Elena Rossi',
              style: GoogleFonts.newsreader(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Expert Craftmaker & DIY Instructor',
              style: TextStyle(color: Color(0xFF3E4531), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              'Helping you master the art of handcrafting through sustainable materials and timeless techniques.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('12.5k', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(' followers  •  ', style: TextStyle(color: Colors.black54)),
                Text('48', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(' lessons', style: TextStyle(color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3E4531),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('edit profile', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDE8D3),
                      foregroundColor: const Color(0xFF3E4531),
                      minimumSize: const Size(0, 50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('share profile', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- TAB BAR ---
  SliverPersistentHeader _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        TabBar(
          indicatorColor: const Color(0xFF3E4531),
          labelColor: const Color(0xFF3E4531),
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'Lessons'),
            Tab(text: 'Workshops'),
            Tab(text: 'Templates'),
          ],
        ),
      ),
    );
  }

  // --- CONTENT ---
  Widget _buildLessonsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured Lessons', 
              style: GoogleFonts.newsreader(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            const Text('See all', style: TextStyle(color: Color(0xFF3E4531), fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        _buildLessonCard(
          title: "Mastering Hand-Built Pottery: For Beginners",
          price: "12,000 DZD",
          desc: "Learn the three basic techniques of hand-building: pinching, coiling, and slab work.",
          rating: "4.9 ★ (120)",
          imageUrl: 'https://images.unsplash.com/photo-1565191999001-551c187427bb?auto=format&fit=crop&q=80&w=400',
        ),
        _buildWorkshopCard(),
        _buildTemplateCard(),
      ],
    );
  }

  Widget _buildLessonCard({required String title, required String price, required String desc, required String rating, required String imageUrl}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 10, right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
                    child: Text(rating, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: GoogleFonts.newsreader(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))),
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E4531))),
                  ],
                ),
                const SizedBox(height: 8),
                Text(desc, style: const TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWorkshopCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network('https://images.unsplash.com/photo-1528819622765-d6bcf132f793?auto=format&fit=crop&q=80&w=400', height: 180, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 10, left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF3E4531), borderRadius: BorderRadius.circular(4)),
                    child: const Text('LIVE WORKSHOP', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("Natural Dyeing with Garden Plants", style: GoogleFonts.newsreader(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))),
                    const Text("8,500 DZD", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E4531))),
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: Color(0xFFF3C3B2)),
                    SizedBox(width: 4),
                    Text("Oct 24, 6:00 PM EST", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTemplateCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3E4531).withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            height: 80, width: 80,
            decoration: BoxDecoration(color: const Color(0xFFFDE8D3), borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.description, color: Color(0xFF3E4531), size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Modern Macramé Plant Hanger Pattern", style: GoogleFonts.newsreader(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                const Text("Digital PDF • 15 pages", style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("1,500 DZD", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E4531))),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: Color(0xFFFDE8D3), shape: BoxShape.circle),
                      child: const Icon(Icons.download, size: 16, color: Color(0xFF3E4531)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // --- FAB ---
  Widget _buildFAB() {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: const Color(0xFF3E4531),
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text('Add Workshop', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  // --- BOTTOM NAV ---



}

// Delegate for the Sticky TabBar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override double get minExtent => _tabBar.preferredSize.height;
  @override double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: const Color(0xFFFFF8F4), child: _tabBar);
  }

  @override bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}


class LibraryPage2 extends StatelessWidget {
  const LibraryPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      // 1. Sub-navigation tabs
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        title: const Text("Techne", style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.primaryGreen)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              _buildTab("Lessons", isActive: true),
              _buildTab("Workshops"),
              _buildTab("Templates"),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Continue Watching",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // 2. Resume Learning Card
            _buildResumeCard(context),

            const SizedBox(height: 24),
            _buildSectionHeader("Your Lessons"),
            
            // 3. Lesson List Items
            _buildLessonItem(
              title: "Introduction to Wheel Throwing",
              subtitle: "8 Lessons • 4h 20m",
              progress: 1.0,
              isCompleted: true,
            ),
            _buildLessonItem(
              title: "Mastering Reactive Glazes",
              subtitle: "12 Lessons • 6h 45m",
              progress: 0.35,
            ),

            const SizedBox(height: 24),
            _buildSectionHeader("Upcoming Workshops"),

            // 4. Workshop Date Items
            _buildWorkshopItem("Oct", "24", "Kiln Maintenance 101", "Live Stream • 2:00 PM EST"),
            _buildWorkshopItem("Nov", "12", "Studio Lighting for Ceramics", "Workshop • 11:00 AM EST"),
          ],
        ),
      ),
    );
  }

  // --- UI BUILDER METHODS ---

  Widget _buildTab(String label, {bool isActive = false}) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(label, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal, color: isActive ? AppColors.primaryGreen : Colors.grey)),
          ),
          if (isActive) Container(height: 2, color: AppColors.primaryGreen),
        ],
      ),
    );
  }

  Widget _buildResumeCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("CURRENT LESSON", style: TextStyle(color: AppColors.accentSage, fontSize: 10, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          const Text(
            "Advanced Hand-Building Techniques",
            style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.72,
                  backgroundColor: Colors.white10,
                  color: AppColors.accentPeach,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              const Text("72%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LibraryPage3())),
            icon: const Icon(Icons.play_circle_fill, color: AppColors.primaryGreen),
            label: const Text("Resume Learning", style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentApricot,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLessonItem({required String title, required String subtitle, required double progress, bool isCompleted = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          Container(width: 60, height: 60, decoration: BoxDecoration(color: AppColors.accentSage, borderRadius: BorderRadius.circular(12))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(value: progress, backgroundColor: Colors.black12, color: AppColors.primaryGreen, minHeight: 4),
                    ),
                    const SizedBox(width: 8),
                    Text(isCompleted ? "COMPLETED" : "${(progress * 100).toInt()}%", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWorkshopItem(String month, String day, String title, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.accentSage.withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
            child: Column(children: [Text(month, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)), Text(day, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))]),
          ),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(time, style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey))])),
          const Icon(Icons.calendar_today, color: AppColors.accentPeach),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
          const Text("View All", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
        ],
      ),
    );
  }
}


class LibraryPage3 extends StatelessWidget {
const LibraryPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      // 1. Techne AppBar
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primaryGreen),
        centerTitle: true,
        title: Text("Techne", style: techneDisplay(size: 24)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text("Artisan", style: TextStyle(fontWeight: FontWeight.w500)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 2. THE TOP SECTION (Image Background + Profile Card)
            Stack(
              clipBehavior: Clip.none, // Allows the profile to overlap
              alignment: Alignment.center,
              children: [
                // THE PICTURE IN THE BACK (Video Player Image)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://placeholder.com/artisan_pottery_wheel.jpg', // Replace with your image asset
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // Dark overlay for contrast
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          size: 70,
                          color: AppColors.accentPeach,
                        ),
                      ),
                    ),
                  ),
                ),

                // 3. THE FLOATING PROFILE CARD (Overlaps the image)
                Positioned(
                  bottom: -60, // Shifts the card down so it overlaps
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.accentApricot,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.accentSage),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://placeholder.com/elena_avatar.jpg'), // Profile Pic
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Elena Rossi", style: techneDisplay(size: 22)),
                              const Text(
                                "Expert Craftmaker",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text("12.5k followers • 48 lessons",
                                  style: TextStyle(fontSize: 11)),
                            ],
                          ),
                        ),
                        _buildContactButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 4. SPACER FOR THE OVERLAP
            const SizedBox(height: 70),

            // 5. THE DETAILED CURRICULUM SECTION (From previous codes)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Section 1: The Foundation",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildLessonItem("1. Introduction to Clay Types", "04:20",
                      isActive: true, isCompleted: true),
                  _buildLessonItem("2. Preparing Your Workspace", "08:15"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Start Today's Lesson",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- UI HELPER METHODS ---

  Widget _buildLessonItem(String title, String time,
      {bool isActive = false, bool isCompleted = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive
          ? AppColors.accentApricot.withOpacity(0.4)
          : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(Icons.play_circle,
              color: isActive ? AppColors.accentPeach : Colors.grey, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          if (isCompleted)
            const Icon(Icons.check_circle,
                color: AppColors.primaryGreen, size: 16),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Contact",
          style: TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

class ListTemplatePage extends StatelessWidget {
  const ListTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream, // #FFFBF7
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primaryGreen),
        title: Text("Techne", style: techneDisplay(size: 24)),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text("ARTISAN", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.grey)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("List a Template", style: techneDisplay(size: 28)),
            const SizedBox(height: 24),

            // 1. Template File Upload Zone
            _buildSectionLabel("Template File"),
            _buildUploadPlaceholder(
              icon: Icons.picture_as_pdf,
              title: "Upload PDF Template",
              subtitle: "Max size 50MB",
            ),

            const SizedBox(height: 24),

            // 2. Preview Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionLabel("Preview Gallery"),
                const Text("ADD IMAGES", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ],
            ),
            const SizedBox(height: 8),
            _buildGalleryRow(),

            const SizedBox(height: 24),

            // 3. Form Section
            _buildFormCard(),

            const SizedBox(height: 24),

            // 4. Creator Pro Tip (No bottom bar below this)
            _buildProTipCard(),
            
            const SizedBox(height: 40), // Bottom padding for clean finish
          ],
        ),
      ),
    );
  }

  // --- UI COMPONENTS ---

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label.toUpperCase(), 
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: AppColors.primaryGreen)),
    );
  }

  Widget _buildUploadPlaceholder({required IconData icon, required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryGreen.withOpacity(0.1), style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.accentPeach, size: 40),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildGalleryRow() {
    return Row(
      children: [
        // Representing the leather image from your reference
        Expanded(
          child: AspectRatio(
            aspectRatio: 3/4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(image: NetworkImage('https://placeholder.com/leather'), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AspectRatio(
            aspectRatio: 3/4,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.accentApricot.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accentPeach.withOpacity(0.5), style: BorderStyle.none),
              ),
              child: const Icon(Icons.add_a_photo, color: AppColors.accentPeach),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormCard() {
    return techneCard( // Using your modular card
      child: Column(
        children: [
          _buildTextField("PATTERN NAME", "e.g. The Heritage Satchel"),
          const SizedBox(height: 16),
          _buildDropdownField("CATEGORY", "Leatherworking"),
          const SizedBox(height: 16),
          _buildDifficultySelector(),
          const SizedBox(height: 16),
          _buildTextField("RECOMMENDED MATERIALS", "List the tools...", maxLines: 3),
          const Divider(height: 32),
          _buildPriceAndPublish(),
        ],
      ),
    );
  }

  Widget _buildProTipCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentApricot.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb, color: AppColors.accentPeach, size: 20),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Creator Pro Tip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 4),
                Text("Templates with at least 4 preview images and a detailed materials list convert 60% better.", 
                  style: TextStyle(fontSize: 12, color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
    );
  }
 // 1. THE TEXT FIELD HELPER
  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(label),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryGreen.withOpacity(0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryGreen.withOpacity(0.05)),
            ),
          ),
        ),
      ],
    );
  }

  // 2. THE DROPDOWN HELPER
  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(label),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryGreen.withOpacity(0.05)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: [value].map((String val) {
                return DropdownMenuItem<String>(value: val, child: Text(val));
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }

  // 3. THE DIFFICULTY SELECTOR
  Widget _buildDifficultySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel("DIFFICULTY LEVEL"),
        Row(
          children: [
            _buildLevelChip("Beginner", isActive: true),
            const SizedBox(width: 8),
            _buildLevelChip("Intermediate"),
            const SizedBox(width: 8),
            _buildLevelChip("Advanced"),
          ],
        ),
      ],
    );
  }

  Widget _buildLevelChip(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryGreen : AppColors.accentSage.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : AppColors.primaryGreen,
        ),
      ),
    );
  }

  // 4. PRICE AND PUBLISH SECTION
  Widget _buildPriceAndPublish() {
    return Column(
      children: [
        _buildTextField("SET PRICE (DZD)", "0.00"),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.publish, color: Colors.white),
          label: const Text("Publish Template", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  } 
  // (Additional helper methods like _buildTextField and _buildDifficultySelector follow the same pattern)
}

class WorkshopSetupPage extends StatelessWidget {
  const WorkshopSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream, // #FAF9F6
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryGreen),
          onPressed: () {},
        ),
        title: Text("Techne", style: techneDisplay(size: 24)),
        centerTitle: false,
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text("ARTISAN", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. DATE & TIME SECTION
            _buildWorkshopCard(
              icon: Icons.calendar_month,
              title: "Select Date & Time",
              child: _buildCalendarGrid(),
            ),
            
            const SizedBox(height: 16),

            // 2. LOCATION SECTION
            _buildWorkshopCard(
              icon: Icons.location_on,
              title: "Location",
              child: _buildLocationInput(),
            ),

            const SizedBox(height: 16),

            // 3. LOGISTICS (Capacity & Price)
            _buildWorkshopCard(
              title: "Logistics",
              child: Column(
                children: [
                  _buildCapacitySlider(),
                  const Divider(height: 32),
                  _buildPriceInput(),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 4. AMENITIES
            _buildWorkshopCard(
              title: "Amenities Provided",
              child: _buildAmenitiesList(),
            ),

            const SizedBox(height: 24),

            // 5. ACTION BUTTON (Final element before the bottom of screen)
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/review'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen, // #3E4531
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Review Workshop Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- REUSABLE WORKSHOP CARD ---
  Widget _buildWorkshopCard({IconData? icon, required String title, required Widget child}) {
    return techneCard( // Using your modular card blueprint
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: AppColors.accentSage, size: 20),
              if (icon != null) const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  // --- SECTION-SPECIFIC HELPERS ---

  Widget _buildCalendarGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Days of week and numerical grid logic
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
              .map((d) => Text(d, style: TextStyle(fontSize: 10, color: Colors.grey.shade400, fontWeight: FontWeight.bold)))
              .toList(),
        ),
        const SizedBox(height: 12),
        // Add your numerical grid logic here...
      ],
    );
  }

  Widget _buildAmenitiesList() {
    return Column(
      children: [
        _buildAmenityTile("Materials Provided", Icons.architecture, true),
        _buildAmenityTile("Coffee & Tea", Icons.coffee, true),
        _buildAmenityTile("WiFi Access", Icons.wifi, false),
        _buildAmenityTile("Parking Available", Icons.local_parking, false),
      ],
    );
  }

  Widget _buildAmenityTile(String label, IconData icon, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: (v) {}, activeColor: AppColors.primaryGreen),
          Text(label, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Icon(icon, color: isChecked ? AppColors.accentSage : Colors.grey.shade300),
        ],
      ),
    );
  }
// 1. THE LOCATION INPUT & MAP
  Widget _buildLocationInput() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Search for a venue or address...",
            hintStyle: TextStyle(color: AppColors.primaryGreen.withOpacity(0.4), fontSize: 14),
            prefixIcon: const Icon(Icons.search, size: 20),
            filled: true,
            fillColor: AppColors.accentSage.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accentSage.withOpacity(0.2)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Stylized Map Placeholder
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage('https://placeholder.com/map_algiers'), // Your map asset
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: const Center(
            child: Icon(Icons.location_on, color: AppColors.primaryGreen, size: 40),
          ),
        ),
      ],
    );
  }

  // 2. THE CAPACITY SLIDER
  Widget _buildCapacitySlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Capacity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("12", style: techneDisplay(size: 24, italic: false)), // Dynamic value
          ],
        ),
        Slider(
          value: 12,
          min: 1,
          max: 50,
          activeColor: AppColors.primaryGreen,
          inactiveColor: AppColors.accentSage.withOpacity(0.3),
          onChanged: (value) {},
        ),
        const Text(
          "Maximum number of attendees for an intimate experience.",
          style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ],
    );
  }

  // 3. THE PRICE INPUT (DZD)
  Widget _buildPriceInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price per Attendee", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.number,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.all(15),
              child: Text("DZD", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            hintText: "0.00",
            filled: true,
            fillColor: AppColors.accentSage.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.accentSage.withOpacity(0.2)),
            ),
          ),
        ),
      ],
    );
  }
  // Use the _buildTextField from the previous screen for the Price/Location inputs
}