state("Drop-Win64-Shipping","1.7")
{
	bool load :0x2005FB0,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x203B1F0,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.6")
{
	bool load :0x2005FB0,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x203B1F0,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.5")
{
	bool load :0x2004FA0,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x1CBA520,0x14,0x68,0x38,0x350,0x10;
}
state("Drop-Win64-Shipping","1.4")
{
	bool load :0x2004FA0,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x203A1E0,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.3")
{
	bool load :0x2001F60,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x2037190,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.2")
{
	bool load :0x2001F60,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x2037190,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.1")
{
	bool load :0x2001F60,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x2037190,0x190,0x58,0x8,0x38,0x200,0x10;
}
state("Drop-Win64-Shipping","1.0")
{
	bool load :0x20283F0,0xB8,0x8,0x328,0x30,0x10;
	bool load2:0x205E3D0,0x190,0x58,0x8,0x38,0x200,0x10;
}
init
{
	timer.IsGameTimePaused=false;

	//Get game version by checking pak file size
	//1.7=7256361027
	//1.6=7249007214 
	//1.5=7234325791
	//1.4=7232244389
	//1.3=7214753176
	//1.2=7213177061
	//1.1=7286976220
	//1.0=7286960627

	var f=modules.First().FileName;
	var p=new FileInfo(f.Substring(0,f.Length-38)+"Content\\Paks\\SkyArk-WindowsNoEditor.pak").Length;
	print("[GASL] Pak: "+p);
	if(p==7256361027){version="1.7";}
	else if(p==7249007214){version="1.6";}
	else if(p==7234325791){version="1.5";}
	else if(p==7232244389){version="1.4";}
	else if(p==7214753176){version="1.3";}
	else if(p==7213177061){version="1.2";}
	else if(p==7286976220){version="1.1";}
	else if(p==7286960627){version="1.0";}
	else{
		MessageBox.Show("Found unknown version with pak '"+p+"'\n\n"+
		"Please mention PrototypeAlpha on the Gravitas Speedrunning discord with the message above.",
		"Gravitas ASL | LiveSplit",MessageBoxButtons.OK,MessageBoxIcon.Error);
	}
	//Prevent timer from starting automatically when opening the game
	if(timer.CurrentPhase==TimerPhase.NotRunning) Thread.Sleep(5000);
}
exit{timer.IsGameTimePaused=true;}
start{return (!current.load&&old.load)||(!current.load2&&old.load2);}
isLoading{return current.load||current.load2;}
