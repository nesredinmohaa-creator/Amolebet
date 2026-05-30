flutter/lll.dart';
import 'dart:fath';
import 'dart:asyn
void main() {runApp(const AmoleBetPro());}
class AmoleBetPro extends StatelessWidget {const AmoleBetPro({super.key});
@override
Widgetbuild(BuildContextcontext){returnMaterialApp(title:'AmoleBet Official',debugShowCheckedModeBanner: true,
theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color(0xFF0B0E11),
primaryColor: const Color(0xFF00C805),
colorScheme: const ColorScheme.dark(primary: Color(0xFF00C805),
secondary: Color(0xFFF59E0B),),),home: const MainLayout(),);}}
class MainLayout extends StatefulWidget {const MainLayout({super.key});
@override
State<MainLayout> createState() => _MainLayoutState();}
class _MainLayoutState extends State<MainLayout> {int _selectedIndex = 0;double _balance = 250.75;void _addBalance(double amount) => setState(() => _balance += amount);
@override
Widgetbuild(BuildContextcontext){finalscreens= [constHomeTab(),AviatorTab(balance:_balance, onWin: _addBalance),
const SportsTab(),
WalletTab(balance: _balance, onAction: _addBalance),];
return Scaffold(appBar: AppBar(elevation: 0,backgroundColor: const Color(0xFF181A20),
title: const Text("AMOLEBET", style: TextStyle(color: Color(0xFF00C805), fontWeight: FontWeight.bold)),actions:[Center(child:Container(padding:constEdgeInsets.symmetric(horizontal: 10, vertical: 5),
decoration:BoxDecoration(color:constColor(0xFF2B2F36),borderRadius:BorderRadius.circular(5,),child: Text("${_balance.toStringAsFixed(2)}ETB",style:const TextStyle(color: Color(0xFF00C805), fontWeight: FontWeight.bold),),),),
const SizedBox(width: 10),],),body: screens[_selectedIndex],
bottomNavigationBar: BottomNavigationBar(currentIndex: _selectedIndex,onTap: (i) => setState(() => _selectedIndex = i),
type: BottomNavigationBarType.fixed,
backgroundColor: const Color(0xFF181A20),
selectedItemColor: const Color(0xFF00C805),
unselectedItemColor: Colors.grey,
items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
BottomNavigationBarItem(icon: Icon(Icons.flight_takeoff), label: "Aviator"),
BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Sports"),
BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),],),);}}
class HomeTab extends StatelessWidget {
const HomeTab({super.key});
@override
Widget build(BuildContext context) {return ListView(padding: const EdgeInsets.all(15),
children:[Container(height:120,decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),gradient:constLinearGradient(colors:[Color(0xFF00C805), Color(0xFF059669)]),),child: const Center(child: Text("100% WELCOME BONUS!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),),
const SizedBox(height: 20),GridView.count(shrinkWrap:true,crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing:10,children:[_gameTile("Aviator",Icons.flight, Colors.red),_gameTile("Crash", Icons.trending_up,Colors.orange),_gameTile("Football",Icons.sports_soccer, Colors.green),_gameTile("Casino", Icons.casino, Colors.purple),],)],);}
Widget _gameTile(String t, IconData i, Color c) => Container(decoration: BoxDecoration(color: const Color(0xFF181A20), borderRadius: BorderRadius.circular(10)),
child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 40, color: c), Text(t)]),);}
class AviatorTab extends StatefulWidget {final double balance;final Function(double) onWin;
const AviatorTab({super.key, required this.balance, required this.onWin});
@override
State<AviatorTab> createState() => _AviatorTabState();}
class _AviatorTabState extends State<AviatorTab> {
double _mult = 1.0;
bool _active = false;
double _bet = 10.0;
Timer? _t;
void _play() {if (widget.balance < _bet) return;widget.onWin(-_bet);setState(() { _active = true; _mult = 1.0; });
double crash = 1.0 + Random().nextDouble() * 5.0;
_t = Timer.periodic(const Duration(milliseconds: 100), (t) {setState(() {_mult += 0.05;
if (_mult >= crash) { _t?.cancel(); _active = false; }});});}
@override
Widget build(BuildContext context) {return Column(children: [Expanded(child: Container(margin: const EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.red, width: 2)),child: Center(child: Text("${_mult.toStringAsFixed(2)}x", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: _active ? Colors.red : Colors.white24)),),),),
Padding(padding:constEdgeInsets.all(20.0),child:Row(children:[Expanded(child: TextField(decoration: const InputDecoration(labelText: "Bet (ETB)"), keyboardType: TextInputType.number, onChanged: (v) => _bet = double.tryParse(v) ?? 10)),
const SizedBox(width: 10),
ElevatedButton(
onPressed: _active ? () { _t?.cancel(); widget.onWin(_bet * _mult); setState(() => _active = false); } : _play,
style: ElevatedButton.styleFrom(backgroundColor: _active ? Colors.orange : Colors.red, minimumSize: const Size(120, 50)),
child: Text(_active ? "CASH OUT" : "BET"),
MainAxisAlignment.center
)
            ],
          ),
        )
      ],
    );
  }
}

class SportsTab extends StatelessWidget {
  const SportsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (c, i) => ListTile(title: Text("Match ${i+1}"), subtitle: const Text("Live Now"), trailing: const Text("Odds: 2.50", style: TextStyle(color: Colors.amber)  }
class WalletTab extends StatelessWidget {  final double balance;
  final Function(double) onAction;
  const WalletTab({super.key, required this.balance, required this.onAction});
  @override
  Widget build(BuildContext context)    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Balance: ${balance.toStringAsFixed(2)} ETB", style: const TextStyle(fontSize: 25, color: Color(0xFF00C805))),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () => onAction(100), child: const Text("DEPOSIT 100 ETB")),      ],   );  }}