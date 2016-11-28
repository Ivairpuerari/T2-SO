
_sh: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f c9 00 00 00    	jg     ea <main+0xea>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 01 12 00 00       	push   $0x1201
      2b:	e8 02 0d 00 00       	call   d32 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 25                	jmp    5e <main+0x5e>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 22 18 00 00 20 	cmpb   $0x20,0x1822
      47:	74 60                	je     a9 <main+0xa9>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      50:	e8 1b 01 00 00       	call   170 <fork1>
      55:	85 c0                	test   %eax,%eax
      57:	74 36                	je     8f <main+0x8f>
      runcmd(parsecmd(buf));
    wait();
      59:	e8 9c 0c 00 00       	call   cfa <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      5e:	83 ec 08             	sub    $0x8,%esp
      61:	6a 64                	push   $0x64
      63:	68 20 18 00 00       	push   $0x1820
      68:	e8 93 00 00 00       	call   100 <getcmd>
      6d:	83 c4 10             	add    $0x10,%esp
      70:	85 c0                	test   %eax,%eax
      72:	78 30                	js     a4 <main+0xa4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      74:	80 3d 20 18 00 00 63 	cmpb   $0x63,0x1820
      7b:	75 d3                	jne    50 <main+0x50>
      7d:	80 3d 21 18 00 00 64 	cmpb   $0x64,0x1821
      84:	74 ba                	je     40 <main+0x40>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      86:	e8 e5 00 00 00       	call   170 <fork1>
      8b:	85 c0                	test   %eax,%eax
      8d:	75 ca                	jne    59 <main+0x59>
      runcmd(parsecmd(buf));
      8f:	83 ec 0c             	sub    $0xc,%esp
      92:	68 20 18 00 00       	push   $0x1820
      97:	e8 a4 09 00 00       	call   a40 <parsecmd>
      9c:	89 04 24             	mov    %eax,(%esp)
      9f:	e8 fc 00 00 00       	call   1a0 <runcmd>
    wait();
  }
  exit();
      a4:	e8 49 0c 00 00       	call   cf2 <exit>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 20 18 00 00       	push   $0x1820
      b1:	e8 7a 0a 00 00       	call   b30 <strlen>
      if(chdir(buf+3) < 0)
      b6:	c7 04 24 23 18 00 00 	movl   $0x1823,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      bd:	c6 80 1f 18 00 00 00 	movb   $0x0,0x181f(%eax)
      if(chdir(buf+3) < 0)
      c4:	e8 99 0c 00 00       	call   d62 <chdir>
      c9:	83 c4 10             	add    $0x10,%esp
      cc:	85 c0                	test   %eax,%eax
      ce:	79 8e                	jns    5e <main+0x5e>
        printf(2, "cannot cd %s\n", buf+3);
      d0:	50                   	push   %eax
      d1:	68 23 18 00 00       	push   $0x1823
      d6:	68 09 12 00 00       	push   $0x1209
      db:	6a 02                	push   $0x2
      dd:	e8 5e 0d 00 00       	call   e40 <printf>
      e2:	83 c4 10             	add    $0x10,%esp
      e5:	e9 74 ff ff ff       	jmp    5e <main+0x5e>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      ea:	83 ec 0c             	sub    $0xc,%esp
      ed:	50                   	push   %eax
      ee:	e8 27 0c 00 00       	call   d1a <close>
      break;
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	e9 63 ff ff ff       	jmp    5e <main+0x5e>
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 0c             	mov    0xc(%ebp),%esi
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     10b:	83 ec 08             	sub    $0x8,%esp
     10e:	68 60 11 00 00       	push   $0x1160
     113:	6a 02                	push   $0x2
     115:	e8 26 0d 00 00       	call   e40 <printf>
  memset(buf, 0, nbuf);
     11a:	83 c4 0c             	add    $0xc,%esp
     11d:	56                   	push   %esi
     11e:	6a 00                	push   $0x0
     120:	53                   	push   %ebx
     121:	e8 3a 0a 00 00       	call   b60 <memset>
  gets(buf, nbuf);
     126:	58                   	pop    %eax
     127:	5a                   	pop    %edx
     128:	56                   	push   %esi
     129:	53                   	push   %ebx
     12a:	e8 91 0a 00 00       	call   bc0 <gets>
     12f:	83 c4 10             	add    $0x10,%esp
     132:	31 c0                	xor    %eax,%eax
     134:	80 3b 00             	cmpb   $0x0,(%ebx)
     137:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     13a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     13d:	f7 d8                	neg    %eax
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5d                   	pop    %ebp
     142:	c3                   	ret    
     143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <panic>:
  exit();
}

void
panic(char *s)
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	68 fd 11 00 00       	push   $0x11fd
     15e:	6a 02                	push   $0x2
     160:	e8 db 0c 00 00       	call   e40 <printf>
  exit();
     165:	e8 88 0b 00 00       	call   cf2 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <fork1>:
}

int
fork1(void)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 14             	sub    $0x14,%esp
  int pid;

  pid = fork(0);
     176:	6a 00                	push   $0x0
     178:	e8 6d 0b 00 00       	call   cea <fork>
  if(pid == -1)
     17d:	83 c4 10             	add    $0x10,%esp
     180:	83 f8 ff             	cmp    $0xffffffff,%eax
     183:	74 02                	je     187 <fork1+0x17>
    panic("fork");
  return pid;
}
     185:	c9                   	leave  
     186:	c3                   	ret    
{
  int pid;

  pid = fork(0);
  if(pid == -1)
    panic("fork");
     187:	83 ec 0c             	sub    $0xc,%esp
     18a:	68 63 11 00 00       	push   $0x1163
     18f:	e8 bc ff ff ff       	call   150 <panic>
     194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 14             	sub    $0x14,%esp
     1a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     1aa:	85 db                	test   %ebx,%ebx
     1ac:	74 64                	je     212 <runcmd+0x72>
    exit();

  switch(cmd->type){
     1ae:	83 3b 05             	cmpl   $0x5,(%ebx)
     1b1:	0f 87 d8 00 00 00    	ja     28f <runcmd+0xef>
     1b7:	8b 03                	mov    (%ebx),%eax
     1b9:	ff 24 85 18 12 00 00 	jmp    *0x1218(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1c3:	83 ec 0c             	sub    $0xc,%esp
     1c6:	50                   	push   %eax
     1c7:	e8 36 0b 00 00       	call   d02 <pipe>
     1cc:	83 c4 10             	add    $0x10,%esp
     1cf:	85 c0                	test   %eax,%eax
     1d1:	0f 88 c5 00 00 00    	js     29c <runcmd+0xfc>
      panic("pipe");
    if(fork1() == 0){
     1d7:	e8 94 ff ff ff       	call   170 <fork1>
     1dc:	85 c0                	test   %eax,%eax
     1de:	0f 84 08 01 00 00    	je     2ec <runcmd+0x14c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1e4:	e8 87 ff ff ff       	call   170 <fork1>
     1e9:	85 c0                	test   %eax,%eax
     1eb:	0f 84 cd 00 00 00    	je     2be <runcmd+0x11e>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1f1:	83 ec 0c             	sub    $0xc,%esp
     1f4:	ff 75 f0             	pushl  -0x10(%ebp)
     1f7:	e8 1e 0b 00 00       	call   d1a <close>
    close(p[1]);
     1fc:	58                   	pop    %eax
     1fd:	ff 75 f4             	pushl  -0xc(%ebp)
     200:	e8 15 0b 00 00       	call   d1a <close>
    wait();
     205:	e8 f0 0a 00 00       	call   cfa <wait>
    wait();
     20a:	e8 eb 0a 00 00       	call   cfa <wait>
    break;
     20f:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
     212:	e8 db 0a 00 00       	call   cf2 <exit>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     217:	e8 54 ff ff ff       	call   170 <fork1>
     21c:	85 c0                	test   %eax,%eax
     21e:	75 f2                	jne    212 <runcmd+0x72>
     220:	eb 62                	jmp    284 <runcmd+0xe4>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     222:	8b 43 04             	mov    0x4(%ebx),%eax
     225:	85 c0                	test   %eax,%eax
     227:	74 e9                	je     212 <runcmd+0x72>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     229:	52                   	push   %edx
     22a:	52                   	push   %edx
     22b:	8d 53 04             	lea    0x4(%ebx),%edx
     22e:	52                   	push   %edx
     22f:	50                   	push   %eax
     230:	e8 f5 0a 00 00       	call   d2a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     235:	83 c4 0c             	add    $0xc,%esp
     238:	ff 73 04             	pushl  0x4(%ebx)
     23b:	68 6f 11 00 00       	push   $0x116f
     240:	6a 02                	push   $0x2
     242:	e8 f9 0b 00 00       	call   e40 <printf>
    break;
     247:	83 c4 10             	add    $0x10,%esp
     24a:	eb c6                	jmp    212 <runcmd+0x72>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     24c:	e8 1f ff ff ff       	call   170 <fork1>
     251:	85 c0                	test   %eax,%eax
     253:	74 2f                	je     284 <runcmd+0xe4>
      runcmd(lcmd->left);
    wait();
     255:	e8 a0 0a 00 00       	call   cfa <wait>
    runcmd(lcmd->right);
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	ff 73 08             	pushl  0x8(%ebx)
     260:	e8 3b ff ff ff       	call   1a0 <runcmd>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     265:	83 ec 0c             	sub    $0xc,%esp
     268:	ff 73 14             	pushl  0x14(%ebx)
     26b:	e8 aa 0a 00 00       	call   d1a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     270:	59                   	pop    %ecx
     271:	58                   	pop    %eax
     272:	ff 73 10             	pushl  0x10(%ebx)
     275:	ff 73 08             	pushl  0x8(%ebx)
     278:	e8 b5 0a 00 00       	call   d32 <open>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	78 25                	js     2a9 <runcmd+0x109>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	ff 73 04             	pushl  0x4(%ebx)
     28a:	e8 11 ff ff ff       	call   1a0 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     28f:	83 ec 0c             	sub    $0xc,%esp
     292:	68 68 11 00 00       	push   $0x1168
     297:	e8 b4 fe ff ff       	call   150 <panic>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 8f 11 00 00       	push   $0x118f
     2a4:	e8 a7 fe ff ff       	call   150 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     2a9:	52                   	push   %edx
     2aa:	ff 73 08             	pushl  0x8(%ebx)
     2ad:	68 7f 11 00 00       	push   $0x117f
     2b2:	6a 02                	push   $0x2
     2b4:	e8 87 0b 00 00       	call   e40 <printf>
      exit();
     2b9:	e8 34 0a 00 00       	call   cf2 <exit>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     2be:	83 ec 0c             	sub    $0xc,%esp
     2c1:	6a 00                	push   $0x0
     2c3:	e8 52 0a 00 00       	call   d1a <close>
      dup(p[0]);
     2c8:	5a                   	pop    %edx
     2c9:	ff 75 f0             	pushl  -0x10(%ebp)
     2cc:	e8 99 0a 00 00       	call   d6a <dup>
      close(p[0]);
     2d1:	59                   	pop    %ecx
     2d2:	ff 75 f0             	pushl  -0x10(%ebp)
     2d5:	e8 40 0a 00 00       	call   d1a <close>
      close(p[1]);
     2da:	58                   	pop    %eax
     2db:	ff 75 f4             	pushl  -0xc(%ebp)
     2de:	e8 37 0a 00 00       	call   d1a <close>
      runcmd(pcmd->right);
     2e3:	58                   	pop    %eax
     2e4:	ff 73 08             	pushl  0x8(%ebx)
     2e7:	e8 b4 fe ff ff       	call   1a0 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     2ec:	83 ec 0c             	sub    $0xc,%esp
     2ef:	6a 01                	push   $0x1
     2f1:	e8 24 0a 00 00       	call   d1a <close>
      dup(p[1]);
     2f6:	58                   	pop    %eax
     2f7:	ff 75 f4             	pushl  -0xc(%ebp)
     2fa:	e8 6b 0a 00 00       	call   d6a <dup>
      close(p[0]);
     2ff:	58                   	pop    %eax
     300:	ff 75 f0             	pushl  -0x10(%ebp)
     303:	e8 12 0a 00 00       	call   d1a <close>
      close(p[1]);
     308:	58                   	pop    %eax
     309:	ff 75 f4             	pushl  -0xc(%ebp)
     30c:	e8 09 0a 00 00       	call   d1a <close>
      runcmd(pcmd->left);
     311:	58                   	pop    %eax
     312:	ff 73 04             	pushl  0x4(%ebx)
     315:	e8 86 fe ff ff       	call   1a0 <runcmd>
     31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     327:	6a 54                	push   $0x54
     329:	e8 42 0d 00 00       	call   1070 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     32e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     331:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     333:	6a 54                	push   $0x54
     335:	6a 00                	push   $0x0
     337:	50                   	push   %eax
     338:	e8 23 08 00 00       	call   b60 <memset>
  cmd->type = EXEC;
     33d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     343:	89 d8                	mov    %ebx,%eax
     345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     348:	c9                   	leave  
     349:	c3                   	ret    
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000350 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 18                	push   $0x18
     359:	e8 12 0d 00 00       	call   1070 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     361:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     363:	6a 18                	push   $0x18
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 f3 07 00 00       	call   b60 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     36d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     370:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     376:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     379:	8b 45 0c             	mov    0xc(%ebp),%eax
     37c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     37f:	8b 45 10             	mov    0x10(%ebp),%eax
     382:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     385:	8b 45 14             	mov    0x14(%ebp),%eax
     388:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     38b:	8b 45 18             	mov    0x18(%ebp),%eax
     38e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     391:	89 d8                	mov    %ebx,%eax
     393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     396:	c9                   	leave  
     397:	c3                   	ret    
     398:	90                   	nop
     399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 c2 0c 00 00       	call   1070 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b3:	6a 0c                	push   $0xc
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 a3 07 00 00       	call   b60 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     3c0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave  
     3d5:	c3                   	ret    
     3d6:	8d 76 00             	lea    0x0(%esi),%esi
     3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 0c                	push   $0xc
     3e9:	e8 82 0c 00 00       	call   1070 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f3:	6a 0c                	push   $0xc
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 63 07 00 00       	call   b60 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     400:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     409:	8b 45 0c             	mov    0xc(%ebp),%eax
     40c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     40f:	89 d8                	mov    %ebx,%eax
     411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     414:	c9                   	leave  
     415:	c3                   	ret    
     416:	8d 76 00             	lea    0x0(%esi),%esi
     419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	53                   	push   %ebx
     424:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     427:	6a 08                	push   $0x8
     429:	e8 42 0c 00 00       	call   1070 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     42e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     431:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     433:	6a 08                	push   $0x8
     435:	6a 00                	push   $0x0
     437:	50                   	push   %eax
     438:	e8 23 07 00 00       	call   b60 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     43d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     440:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     446:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     449:	89 d8                	mov    %ebx,%eax
     44b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     44e:	c9                   	leave  
     44f:	c3                   	ret    

00000450 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
     456:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     459:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     45c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     45f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     462:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     464:	39 df                	cmp    %ebx,%edi
     466:	72 13                	jb     47b <gettoken+0x2b>
     468:	eb 29                	jmp    493 <gettoken+0x43>
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     470:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     473:	39 fb                	cmp    %edi,%ebx
     475:	0f 84 ed 00 00 00    	je     568 <gettoken+0x118>
     47b:	0f be 07             	movsbl (%edi),%eax
     47e:	83 ec 08             	sub    $0x8,%esp
     481:	50                   	push   %eax
     482:	68 08 18 00 00       	push   $0x1808
     487:	e8 f4 06 00 00       	call   b80 <strchr>
     48c:	83 c4 10             	add    $0x10,%esp
     48f:	85 c0                	test   %eax,%eax
     491:	75 dd                	jne    470 <gettoken+0x20>
    s++;
  if(q)
     493:	85 f6                	test   %esi,%esi
     495:	74 02                	je     499 <gettoken+0x49>
    *q = s;
     497:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     499:	0f be 37             	movsbl (%edi),%esi
     49c:	89 f1                	mov    %esi,%ecx
     49e:	89 f0                	mov    %esi,%eax
  switch(*s){
     4a0:	80 f9 29             	cmp    $0x29,%cl
     4a3:	7f 5b                	jg     500 <gettoken+0xb0>
     4a5:	80 f9 28             	cmp    $0x28,%cl
     4a8:	7d 61                	jge    50b <gettoken+0xbb>
     4aa:	84 c9                	test   %cl,%cl
     4ac:	0f 85 de 00 00 00    	jne    590 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4b2:	8b 55 14             	mov    0x14(%ebp),%edx
     4b5:	85 d2                	test   %edx,%edx
     4b7:	74 05                	je     4be <gettoken+0x6e>
    *eq = s;
     4b9:	8b 45 14             	mov    0x14(%ebp),%eax
     4bc:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4be:	39 fb                	cmp    %edi,%ebx
     4c0:	77 0d                	ja     4cf <gettoken+0x7f>
     4c2:	eb 23                	jmp    4e7 <gettoken+0x97>
     4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4c8:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     4cb:	39 fb                	cmp    %edi,%ebx
     4cd:	74 18                	je     4e7 <gettoken+0x97>
     4cf:	0f be 07             	movsbl (%edi),%eax
     4d2:	83 ec 08             	sub    $0x8,%esp
     4d5:	50                   	push   %eax
     4d6:	68 08 18 00 00       	push   $0x1808
     4db:	e8 a0 06 00 00       	call   b80 <strchr>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	85 c0                	test   %eax,%eax
     4e5:	75 e1                	jne    4c8 <gettoken+0x78>
    s++;
  *ps = s;
     4e7:	8b 45 08             	mov    0x8(%ebp),%eax
     4ea:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ef:	89 f0                	mov    %esi,%eax
     4f1:	5b                   	pop    %ebx
     4f2:	5e                   	pop    %esi
     4f3:	5f                   	pop    %edi
     4f4:	5d                   	pop    %ebp
     4f5:	c3                   	ret    
     4f6:	8d 76 00             	lea    0x0(%esi),%esi
     4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     500:	80 f9 3e             	cmp    $0x3e,%cl
     503:	75 0b                	jne    510 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     505:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     509:	74 75                	je     580 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     50b:	83 c7 01             	add    $0x1,%edi
     50e:	eb a2                	jmp    4b2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     510:	7f 5e                	jg     570 <gettoken+0x120>
     512:	83 e9 3b             	sub    $0x3b,%ecx
     515:	80 f9 01             	cmp    $0x1,%cl
     518:	76 f1                	jbe    50b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     51a:	39 fb                	cmp    %edi,%ebx
     51c:	77 24                	ja     542 <gettoken+0xf2>
     51e:	eb 7c                	jmp    59c <gettoken+0x14c>
     520:	0f be 07             	movsbl (%edi),%eax
     523:	83 ec 08             	sub    $0x8,%esp
     526:	50                   	push   %eax
     527:	68 00 18 00 00       	push   $0x1800
     52c:	e8 4f 06 00 00       	call   b80 <strchr>
     531:	83 c4 10             	add    $0x10,%esp
     534:	85 c0                	test   %eax,%eax
     536:	75 1f                	jne    557 <gettoken+0x107>
      s++;
     538:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     53b:	39 fb                	cmp    %edi,%ebx
     53d:	74 5b                	je     59a <gettoken+0x14a>
     53f:	0f be 07             	movsbl (%edi),%eax
     542:	83 ec 08             	sub    $0x8,%esp
     545:	50                   	push   %eax
     546:	68 08 18 00 00       	push   $0x1808
     54b:	e8 30 06 00 00       	call   b80 <strchr>
     550:	83 c4 10             	add    $0x10,%esp
     553:	85 c0                	test   %eax,%eax
     555:	74 c9                	je     520 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     557:	be 61 00 00 00       	mov    $0x61,%esi
     55c:	e9 51 ff ff ff       	jmp    4b2 <gettoken+0x62>
     561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     568:	89 df                	mov    %ebx,%edi
     56a:	e9 24 ff ff ff       	jmp    493 <gettoken+0x43>
     56f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     570:	80 f9 7c             	cmp    $0x7c,%cl
     573:	74 96                	je     50b <gettoken+0xbb>
     575:	eb a3                	jmp    51a <gettoken+0xca>
     577:	89 f6                	mov    %esi,%esi
     579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     580:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     583:	be 2b 00 00 00       	mov    $0x2b,%esi
     588:	e9 25 ff ff ff       	jmp    4b2 <gettoken+0x62>
     58d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     590:	80 f9 26             	cmp    $0x26,%cl
     593:	75 85                	jne    51a <gettoken+0xca>
     595:	e9 71 ff ff ff       	jmp    50b <gettoken+0xbb>
     59a:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     59c:	8b 45 14             	mov    0x14(%ebp),%eax
     59f:	be 61 00 00 00       	mov    $0x61,%esi
     5a4:	85 c0                	test   %eax,%eax
     5a6:	0f 85 0d ff ff ff    	jne    4b9 <gettoken+0x69>
     5ac:	e9 36 ff ff ff       	jmp    4e7 <gettoken+0x97>
     5b1:	eb 0d                	jmp    5c0 <peek>
     5b3:	90                   	nop
     5b4:	90                   	nop
     5b5:	90                   	nop
     5b6:	90                   	nop
     5b7:	90                   	nop
     5b8:	90                   	nop
     5b9:	90                   	nop
     5ba:	90                   	nop
     5bb:	90                   	nop
     5bc:	90                   	nop
     5bd:	90                   	nop
     5be:	90                   	nop
     5bf:	90                   	nop

000005c0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	53                   	push   %ebx
     5c6:	83 ec 0c             	sub    $0xc,%esp
     5c9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5cf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5d1:	39 f3                	cmp    %esi,%ebx
     5d3:	72 12                	jb     5e7 <peek+0x27>
     5d5:	eb 28                	jmp    5ff <peek+0x3f>
     5d7:	89 f6                	mov    %esi,%esi
     5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     5e0:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     5e3:	39 de                	cmp    %ebx,%esi
     5e5:	74 18                	je     5ff <peek+0x3f>
     5e7:	0f be 03             	movsbl (%ebx),%eax
     5ea:	83 ec 08             	sub    $0x8,%esp
     5ed:	50                   	push   %eax
     5ee:	68 08 18 00 00       	push   $0x1808
     5f3:	e8 88 05 00 00       	call   b80 <strchr>
     5f8:	83 c4 10             	add    $0x10,%esp
     5fb:	85 c0                	test   %eax,%eax
     5fd:	75 e1                	jne    5e0 <peek+0x20>
    s++;
  *ps = s;
     5ff:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     601:	0f be 13             	movsbl (%ebx),%edx
     604:	31 c0                	xor    %eax,%eax
     606:	84 d2                	test   %dl,%dl
     608:	74 17                	je     621 <peek+0x61>
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	52                   	push   %edx
     60e:	ff 75 10             	pushl  0x10(%ebp)
     611:	e8 6a 05 00 00       	call   b80 <strchr>
     616:	83 c4 10             	add    $0x10,%esp
     619:	85 c0                	test   %eax,%eax
     61b:	0f 95 c0             	setne  %al
     61e:	0f b6 c0             	movzbl %al,%eax
}
     621:	8d 65 f4             	lea    -0xc(%ebp),%esp
     624:	5b                   	pop    %ebx
     625:	5e                   	pop    %esi
     626:	5f                   	pop    %edi
     627:	5d                   	pop    %ebp
     628:	c3                   	ret    
     629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000630 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 1c             	sub    $0x1c,%esp
     639:	8b 75 0c             	mov    0xc(%ebp),%esi
     63c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     63f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     640:	83 ec 04             	sub    $0x4,%esp
     643:	68 b1 11 00 00       	push   $0x11b1
     648:	53                   	push   %ebx
     649:	56                   	push   %esi
     64a:	e8 71 ff ff ff       	call   5c0 <peek>
     64f:	83 c4 10             	add    $0x10,%esp
     652:	85 c0                	test   %eax,%eax
     654:	74 6a                	je     6c0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     656:	6a 00                	push   $0x0
     658:	6a 00                	push   $0x0
     65a:	53                   	push   %ebx
     65b:	56                   	push   %esi
     65c:	e8 ef fd ff ff       	call   450 <gettoken>
     661:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     663:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     666:	50                   	push   %eax
     667:	8d 45 e0             	lea    -0x20(%ebp),%eax
     66a:	50                   	push   %eax
     66b:	53                   	push   %ebx
     66c:	56                   	push   %esi
     66d:	e8 de fd ff ff       	call   450 <gettoken>
     672:	83 c4 20             	add    $0x20,%esp
     675:	83 f8 61             	cmp    $0x61,%eax
     678:	75 51                	jne    6cb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     67a:	83 ff 3c             	cmp    $0x3c,%edi
     67d:	74 31                	je     6b0 <parseredirs+0x80>
     67f:	83 ff 3e             	cmp    $0x3e,%edi
     682:	74 05                	je     689 <parseredirs+0x59>
     684:	83 ff 2b             	cmp    $0x2b,%edi
     687:	75 b7                	jne    640 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     689:	83 ec 0c             	sub    $0xc,%esp
     68c:	6a 01                	push   $0x1
     68e:	68 01 02 00 00       	push   $0x201
     693:	ff 75 e4             	pushl  -0x1c(%ebp)
     696:	ff 75 e0             	pushl  -0x20(%ebp)
     699:	ff 75 08             	pushl  0x8(%ebp)
     69c:	e8 af fc ff ff       	call   350 <redircmd>
      break;
     6a1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6a4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     6a7:	eb 97                	jmp    640 <parseredirs+0x10>
     6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6b0:	83 ec 0c             	sub    $0xc,%esp
     6b3:	6a 00                	push   $0x0
     6b5:	6a 00                	push   $0x0
     6b7:	eb da                	jmp    693 <parseredirs+0x63>
     6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     6c0:	8b 45 08             	mov    0x8(%ebp),%eax
     6c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6c6:	5b                   	pop    %ebx
     6c7:	5e                   	pop    %esi
     6c8:	5f                   	pop    %edi
     6c9:	5d                   	pop    %ebp
     6ca:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     6cb:	83 ec 0c             	sub    $0xc,%esp
     6ce:	68 94 11 00 00       	push   $0x1194
     6d3:	e8 78 fa ff ff       	call   150 <panic>
     6d8:	90                   	nop
     6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	57                   	push   %edi
     6e4:	56                   	push   %esi
     6e5:	53                   	push   %ebx
     6e6:	83 ec 30             	sub    $0x30,%esp
     6e9:	8b 75 08             	mov    0x8(%ebp),%esi
     6ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6ef:	68 b4 11 00 00       	push   $0x11b4
     6f4:	57                   	push   %edi
     6f5:	56                   	push   %esi
     6f6:	e8 c5 fe ff ff       	call   5c0 <peek>
     6fb:	83 c4 10             	add    $0x10,%esp
     6fe:	85 c0                	test   %eax,%eax
     700:	0f 85 9a 00 00 00    	jne    7a0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     706:	e8 15 fc ff ff       	call   320 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     70b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     70e:	89 c3                	mov    %eax,%ebx
     710:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     713:	57                   	push   %edi
     714:	56                   	push   %esi
     715:	8d 5b 04             	lea    0x4(%ebx),%ebx
     718:	50                   	push   %eax
     719:	e8 12 ff ff ff       	call   630 <parseredirs>
     71e:	83 c4 10             	add    $0x10,%esp
     721:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     724:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     72b:	eb 16                	jmp    743 <parseexec+0x63>
     72d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     730:	83 ec 04             	sub    $0x4,%esp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	ff 75 d0             	pushl  -0x30(%ebp)
     738:	e8 f3 fe ff ff       	call   630 <parseredirs>
     73d:	83 c4 10             	add    $0x10,%esp
     740:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     743:	83 ec 04             	sub    $0x4,%esp
     746:	68 cb 11 00 00       	push   $0x11cb
     74b:	57                   	push   %edi
     74c:	56                   	push   %esi
     74d:	e8 6e fe ff ff       	call   5c0 <peek>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	75 5f                	jne    7b8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     759:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     75c:	50                   	push   %eax
     75d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     760:	50                   	push   %eax
     761:	57                   	push   %edi
     762:	56                   	push   %esi
     763:	e8 e8 fc ff ff       	call   450 <gettoken>
     768:	83 c4 10             	add    $0x10,%esp
     76b:	85 c0                	test   %eax,%eax
     76d:	74 49                	je     7b8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     76f:	83 f8 61             	cmp    $0x61,%eax
     772:	75 66                	jne    7da <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     774:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     777:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     77b:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     77e:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     781:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     784:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     787:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     78a:	83 f8 0a             	cmp    $0xa,%eax
     78d:	75 a1                	jne    730 <parseexec+0x50>
      panic("too many args");
     78f:	83 ec 0c             	sub    $0xc,%esp
     792:	68 bd 11 00 00       	push   $0x11bd
     797:	e8 b4 f9 ff ff       	call   150 <panic>
     79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     7a0:	83 ec 08             	sub    $0x8,%esp
     7a3:	57                   	push   %edi
     7a4:	56                   	push   %esi
     7a5:	e8 56 01 00 00       	call   900 <parseblock>
     7aa:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7b0:	5b                   	pop    %ebx
     7b1:	5e                   	pop    %esi
     7b2:	5f                   	pop    %edi
     7b3:	5d                   	pop    %ebp
     7b4:	c3                   	ret    
     7b5:	8d 76 00             	lea    0x0(%esi),%esi
     7b8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     7bb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     7be:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     7c1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     7c8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     7cf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     7d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7d5:	5b                   	pop    %ebx
     7d6:	5e                   	pop    %esi
     7d7:	5f                   	pop    %edi
     7d8:	5d                   	pop    %ebp
     7d9:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     7da:	83 ec 0c             	sub    $0xc,%esp
     7dd:	68 b6 11 00 00       	push   $0x11b6
     7e2:	e8 69 f9 ff ff       	call   150 <panic>
     7e7:	89 f6                	mov    %esi,%esi
     7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007f0 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     7f0:	55                   	push   %ebp
     7f1:	89 e5                	mov    %esp,%ebp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	53                   	push   %ebx
     7f6:	83 ec 14             	sub    $0x14,%esp
     7f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     7fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     7ff:	56                   	push   %esi
     800:	53                   	push   %ebx
     801:	e8 da fe ff ff       	call   6e0 <parseexec>
  if(peek(ps, es, "|")){
     806:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     809:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     80b:	68 d0 11 00 00       	push   $0x11d0
     810:	56                   	push   %esi
     811:	53                   	push   %ebx
     812:	e8 a9 fd ff ff       	call   5c0 <peek>
     817:	83 c4 10             	add    $0x10,%esp
     81a:	85 c0                	test   %eax,%eax
     81c:	75 12                	jne    830 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     81e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     821:	89 f8                	mov    %edi,%eax
     823:	5b                   	pop    %ebx
     824:	5e                   	pop    %esi
     825:	5f                   	pop    %edi
     826:	5d                   	pop    %ebp
     827:	c3                   	ret    
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     830:	6a 00                	push   $0x0
     832:	6a 00                	push   $0x0
     834:	56                   	push   %esi
     835:	53                   	push   %ebx
     836:	e8 15 fc ff ff       	call   450 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     83b:	58                   	pop    %eax
     83c:	5a                   	pop    %edx
     83d:	56                   	push   %esi
     83e:	53                   	push   %ebx
     83f:	e8 ac ff ff ff       	call   7f0 <parsepipe>
     844:	89 7d 08             	mov    %edi,0x8(%ebp)
     847:	89 45 0c             	mov    %eax,0xc(%ebp)
     84a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     84d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     850:	5b                   	pop    %ebx
     851:	5e                   	pop    %esi
     852:	5f                   	pop    %edi
     853:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     854:	e9 47 fb ff ff       	jmp    3a0 <pipecmd>
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000860 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 14             	sub    $0x14,%esp
     869:	8b 5d 08             	mov    0x8(%ebp),%ebx
     86c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     86f:	56                   	push   %esi
     870:	53                   	push   %ebx
     871:	e8 7a ff ff ff       	call   7f0 <parsepipe>
  while(peek(ps, es, "&")){
     876:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     879:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     87b:	eb 1b                	jmp    898 <parseline+0x38>
     87d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     880:	6a 00                	push   $0x0
     882:	6a 00                	push   $0x0
     884:	56                   	push   %esi
     885:	53                   	push   %ebx
     886:	e8 c5 fb ff ff       	call   450 <gettoken>
    cmd = backcmd(cmd);
     88b:	89 3c 24             	mov    %edi,(%esp)
     88e:	e8 8d fb ff ff       	call   420 <backcmd>
     893:	83 c4 10             	add    $0x10,%esp
     896:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     898:	83 ec 04             	sub    $0x4,%esp
     89b:	68 d2 11 00 00       	push   $0x11d2
     8a0:	56                   	push   %esi
     8a1:	53                   	push   %ebx
     8a2:	e8 19 fd ff ff       	call   5c0 <peek>
     8a7:	83 c4 10             	add    $0x10,%esp
     8aa:	85 c0                	test   %eax,%eax
     8ac:	75 d2                	jne    880 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     8ae:	83 ec 04             	sub    $0x4,%esp
     8b1:	68 ce 11 00 00       	push   $0x11ce
     8b6:	56                   	push   %esi
     8b7:	53                   	push   %ebx
     8b8:	e8 03 fd ff ff       	call   5c0 <peek>
     8bd:	83 c4 10             	add    $0x10,%esp
     8c0:	85 c0                	test   %eax,%eax
     8c2:	75 0c                	jne    8d0 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     8c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8c7:	89 f8                	mov    %edi,%eax
     8c9:	5b                   	pop    %ebx
     8ca:	5e                   	pop    %esi
     8cb:	5f                   	pop    %edi
     8cc:	5d                   	pop    %ebp
     8cd:	c3                   	ret    
     8ce:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     8d0:	6a 00                	push   $0x0
     8d2:	6a 00                	push   $0x0
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	e8 75 fb ff ff       	call   450 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     8db:	58                   	pop    %eax
     8dc:	5a                   	pop    %edx
     8dd:	56                   	push   %esi
     8de:	53                   	push   %ebx
     8df:	e8 7c ff ff ff       	call   860 <parseline>
     8e4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8e7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8ea:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     8ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f0:	5b                   	pop    %ebx
     8f1:	5e                   	pop    %esi
     8f2:	5f                   	pop    %edi
     8f3:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     8f4:	e9 e7 fa ff ff       	jmp    3e0 <listcmd>
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 10             	sub    $0x10,%esp
     909:	8b 5d 08             	mov    0x8(%ebp),%ebx
     90c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     90f:	68 b4 11 00 00       	push   $0x11b4
     914:	56                   	push   %esi
     915:	53                   	push   %ebx
     916:	e8 a5 fc ff ff       	call   5c0 <peek>
     91b:	83 c4 10             	add    $0x10,%esp
     91e:	85 c0                	test   %eax,%eax
     920:	74 4a                	je     96c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     922:	6a 00                	push   $0x0
     924:	6a 00                	push   $0x0
     926:	56                   	push   %esi
     927:	53                   	push   %ebx
     928:	e8 23 fb ff ff       	call   450 <gettoken>
  cmd = parseline(ps, es);
     92d:	58                   	pop    %eax
     92e:	5a                   	pop    %edx
     92f:	56                   	push   %esi
     930:	53                   	push   %ebx
     931:	e8 2a ff ff ff       	call   860 <parseline>
  if(!peek(ps, es, ")"))
     936:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     939:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     93b:	68 f0 11 00 00       	push   $0x11f0
     940:	56                   	push   %esi
     941:	53                   	push   %ebx
     942:	e8 79 fc ff ff       	call   5c0 <peek>
     947:	83 c4 10             	add    $0x10,%esp
     94a:	85 c0                	test   %eax,%eax
     94c:	74 2b                	je     979 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     94e:	6a 00                	push   $0x0
     950:	6a 00                	push   $0x0
     952:	56                   	push   %esi
     953:	53                   	push   %ebx
     954:	e8 f7 fa ff ff       	call   450 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     959:	83 c4 0c             	add    $0xc,%esp
     95c:	56                   	push   %esi
     95d:	53                   	push   %ebx
     95e:	57                   	push   %edi
     95f:	e8 cc fc ff ff       	call   630 <parseredirs>
  return cmd;
}
     964:	8d 65 f4             	lea    -0xc(%ebp),%esp
     967:	5b                   	pop    %ebx
     968:	5e                   	pop    %esi
     969:	5f                   	pop    %edi
     96a:	5d                   	pop    %ebp
     96b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     96c:	83 ec 0c             	sub    $0xc,%esp
     96f:	68 d4 11 00 00       	push   $0x11d4
     974:	e8 d7 f7 ff ff       	call   150 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     979:	83 ec 0c             	sub    $0xc,%esp
     97c:	68 df 11 00 00       	push   $0x11df
     981:	e8 ca f7 ff ff       	call   150 <panic>
     986:	8d 76 00             	lea    0x0(%esi),%esi
     989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     990:	55                   	push   %ebp
     991:	89 e5                	mov    %esp,%ebp
     993:	53                   	push   %ebx
     994:	83 ec 04             	sub    $0x4,%esp
     997:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     99a:	85 db                	test   %ebx,%ebx
     99c:	0f 84 96 00 00 00    	je     a38 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     9a2:	83 3b 05             	cmpl   $0x5,(%ebx)
     9a5:	77 48                	ja     9ef <nulterminate+0x5f>
     9a7:	8b 03                	mov    (%ebx),%eax
     9a9:	ff 24 85 30 12 00 00 	jmp    *0x1230(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     9b0:	83 ec 0c             	sub    $0xc,%esp
     9b3:	ff 73 04             	pushl  0x4(%ebx)
     9b6:	e8 d5 ff ff ff       	call   990 <nulterminate>
    nulterminate(lcmd->right);
     9bb:	58                   	pop    %eax
     9bc:	ff 73 08             	pushl  0x8(%ebx)
     9bf:	e8 cc ff ff ff       	call   990 <nulterminate>
    break;
     9c4:	83 c4 10             	add    $0x10,%esp
     9c7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9cc:	c9                   	leave  
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     9d0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     9d3:	8d 43 2c             	lea    0x2c(%ebx),%eax
     9d6:	85 c9                	test   %ecx,%ecx
     9d8:	74 15                	je     9ef <nulterminate+0x5f>
     9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     9e0:	8b 10                	mov    (%eax),%edx
     9e2:	83 c0 04             	add    $0x4,%eax
     9e5:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     9e8:	8b 50 d8             	mov    -0x28(%eax),%edx
     9eb:	85 d2                	test   %edx,%edx
     9ed:	75 f1                	jne    9e0 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     9ef:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9f4:	c9                   	leave  
     9f5:	c3                   	ret    
     9f6:	8d 76 00             	lea    0x0(%esi),%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a00:	83 ec 0c             	sub    $0xc,%esp
     a03:	ff 73 04             	pushl  0x4(%ebx)
     a06:	e8 85 ff ff ff       	call   990 <nulterminate>
    break;
     a0b:	89 d8                	mov    %ebx,%eax
     a0d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     a10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a13:	c9                   	leave  
     a14:	c3                   	ret    
     a15:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a18:	83 ec 0c             	sub    $0xc,%esp
     a1b:	ff 73 04             	pushl  0x4(%ebx)
     a1e:	e8 6d ff ff ff       	call   990 <nulterminate>
    *rcmd->efile = 0;
     a23:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a26:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     a29:	c6 00 00             	movb   $0x0,(%eax)
    break;
     a2c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a31:	c9                   	leave  
     a32:	c3                   	ret    
     a33:	90                   	nop
     a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     a38:	31 c0                	xor    %eax,%eax
     a3a:	eb 8d                	jmp    9c9 <nulterminate+0x39>
     a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a40 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	56                   	push   %esi
     a44:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a45:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a48:	83 ec 0c             	sub    $0xc,%esp
     a4b:	53                   	push   %ebx
     a4c:	e8 df 00 00 00       	call   b30 <strlen>
  cmd = parseline(&s, es);
     a51:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a52:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     a54:	8d 45 08             	lea    0x8(%ebp),%eax
     a57:	5e                   	pop    %esi
     a58:	53                   	push   %ebx
     a59:	50                   	push   %eax
     a5a:	e8 01 fe ff ff       	call   860 <parseline>
     a5f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     a61:	8d 45 08             	lea    0x8(%ebp),%eax
     a64:	83 c4 0c             	add    $0xc,%esp
     a67:	68 7e 11 00 00       	push   $0x117e
     a6c:	53                   	push   %ebx
     a6d:	50                   	push   %eax
     a6e:	e8 4d fb ff ff       	call   5c0 <peek>
  if(s != es){
     a73:	8b 45 08             	mov    0x8(%ebp),%eax
     a76:	83 c4 10             	add    $0x10,%esp
     a79:	39 c3                	cmp    %eax,%ebx
     a7b:	75 12                	jne    a8f <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     a7d:	83 ec 0c             	sub    $0xc,%esp
     a80:	56                   	push   %esi
     a81:	e8 0a ff ff ff       	call   990 <nulterminate>
  return cmd;
}
     a86:	8d 65 f8             	lea    -0x8(%ebp),%esp
     a89:	89 f0                	mov    %esi,%eax
     a8b:	5b                   	pop    %ebx
     a8c:	5e                   	pop    %esi
     a8d:	5d                   	pop    %ebp
     a8e:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     a8f:	52                   	push   %edx
     a90:	50                   	push   %eax
     a91:	68 f2 11 00 00       	push   $0x11f2
     a96:	6a 02                	push   $0x2
     a98:	e8 a3 03 00 00       	call   e40 <printf>
    panic("syntax");
     a9d:	c7 04 24 b6 11 00 00 	movl   $0x11b6,(%esp)
     aa4:	e8 a7 f6 ff ff       	call   150 <panic>
     aa9:	66 90                	xchg   %ax,%ax
     aab:	66 90                	xchg   %ax,%ax
     aad:	66 90                	xchg   %ax,%ax
     aaf:	90                   	nop

00000ab0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	8b 45 08             	mov    0x8(%ebp),%eax
     ab7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     aba:	89 c2                	mov    %eax,%edx
     abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ac0:	83 c1 01             	add    $0x1,%ecx
     ac3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ac7:	83 c2 01             	add    $0x1,%edx
     aca:	84 db                	test   %bl,%bl
     acc:	88 5a ff             	mov    %bl,-0x1(%edx)
     acf:	75 ef                	jne    ac0 <strcpy+0x10>
    ;
  return os;
}
     ad1:	5b                   	pop    %ebx
     ad2:	5d                   	pop    %ebp
     ad3:	c3                   	ret    
     ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ae0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	56                   	push   %esi
     ae4:	53                   	push   %ebx
     ae5:	8b 55 08             	mov    0x8(%ebp),%edx
     ae8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     aeb:	0f b6 02             	movzbl (%edx),%eax
     aee:	0f b6 19             	movzbl (%ecx),%ebx
     af1:	84 c0                	test   %al,%al
     af3:	75 1e                	jne    b13 <strcmp+0x33>
     af5:	eb 29                	jmp    b20 <strcmp+0x40>
     af7:	89 f6                	mov    %esi,%esi
     af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     b00:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b03:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     b06:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b09:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     b0d:	84 c0                	test   %al,%al
     b0f:	74 0f                	je     b20 <strcmp+0x40>
     b11:	89 f1                	mov    %esi,%ecx
     b13:	38 d8                	cmp    %bl,%al
     b15:	74 e9                	je     b00 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b17:	29 d8                	sub    %ebx,%eax
}
     b19:	5b                   	pop    %ebx
     b1a:	5e                   	pop    %esi
     b1b:	5d                   	pop    %ebp
     b1c:	c3                   	ret    
     b1d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b20:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b22:	29 d8                	sub    %ebx,%eax
}
     b24:	5b                   	pop    %ebx
     b25:	5e                   	pop    %esi
     b26:	5d                   	pop    %ebp
     b27:	c3                   	ret    
     b28:	90                   	nop
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <strlen>:

uint
strlen(char *s)
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b36:	80 39 00             	cmpb   $0x0,(%ecx)
     b39:	74 12                	je     b4d <strlen+0x1d>
     b3b:	31 d2                	xor    %edx,%edx
     b3d:	8d 76 00             	lea    0x0(%esi),%esi
     b40:	83 c2 01             	add    $0x1,%edx
     b43:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b47:	89 d0                	mov    %edx,%eax
     b49:	75 f5                	jne    b40 <strlen+0x10>
    ;
  return n;
}
     b4b:	5d                   	pop    %ebp
     b4c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     b4d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     b4f:	5d                   	pop    %ebp
     b50:	c3                   	ret    
     b51:	eb 0d                	jmp    b60 <memset>
     b53:	90                   	nop
     b54:	90                   	nop
     b55:	90                   	nop
     b56:	90                   	nop
     b57:	90                   	nop
     b58:	90                   	nop
     b59:	90                   	nop
     b5a:	90                   	nop
     b5b:	90                   	nop
     b5c:	90                   	nop
     b5d:	90                   	nop
     b5e:	90                   	nop
     b5f:	90                   	nop

00000b60 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b67:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b6a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b6d:	89 d7                	mov    %edx,%edi
     b6f:	fc                   	cld    
     b70:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b72:	89 d0                	mov    %edx,%eax
     b74:	5f                   	pop    %edi
     b75:	5d                   	pop    %ebp
     b76:	c3                   	ret    
     b77:	89 f6                	mov    %esi,%esi
     b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <strchr>:

char*
strchr(const char *s, char c)
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	53                   	push   %ebx
     b84:	8b 45 08             	mov    0x8(%ebp),%eax
     b87:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     b8a:	0f b6 10             	movzbl (%eax),%edx
     b8d:	84 d2                	test   %dl,%dl
     b8f:	74 1d                	je     bae <strchr+0x2e>
    if(*s == c)
     b91:	38 d3                	cmp    %dl,%bl
     b93:	89 d9                	mov    %ebx,%ecx
     b95:	75 0d                	jne    ba4 <strchr+0x24>
     b97:	eb 17                	jmp    bb0 <strchr+0x30>
     b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ba0:	38 ca                	cmp    %cl,%dl
     ba2:	74 0c                	je     bb0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     ba4:	83 c0 01             	add    $0x1,%eax
     ba7:	0f b6 10             	movzbl (%eax),%edx
     baa:	84 d2                	test   %dl,%dl
     bac:	75 f2                	jne    ba0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     bae:	31 c0                	xor    %eax,%eax
}
     bb0:	5b                   	pop    %ebx
     bb1:	5d                   	pop    %ebp
     bb2:	c3                   	ret    
     bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bc0 <gets>:

char*
gets(char *buf, int max)
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	57                   	push   %edi
     bc4:	56                   	push   %esi
     bc5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bc6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     bc8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     bcb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bce:	eb 29                	jmp    bf9 <gets+0x39>
    cc = read(0, &c, 1);
     bd0:	83 ec 04             	sub    $0x4,%esp
     bd3:	6a 01                	push   $0x1
     bd5:	57                   	push   %edi
     bd6:	6a 00                	push   $0x0
     bd8:	e8 2d 01 00 00       	call   d0a <read>
    if(cc < 1)
     bdd:	83 c4 10             	add    $0x10,%esp
     be0:	85 c0                	test   %eax,%eax
     be2:	7e 1d                	jle    c01 <gets+0x41>
      break;
    buf[i++] = c;
     be4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     be8:	8b 55 08             	mov    0x8(%ebp),%edx
     beb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     bed:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     bef:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     bf3:	74 1b                	je     c10 <gets+0x50>
     bf5:	3c 0d                	cmp    $0xd,%al
     bf7:	74 17                	je     c10 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bf9:	8d 5e 01             	lea    0x1(%esi),%ebx
     bfc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     bff:	7c cf                	jl     bd0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c01:	8b 45 08             	mov    0x8(%ebp),%eax
     c04:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c0b:	5b                   	pop    %ebx
     c0c:	5e                   	pop    %esi
     c0d:	5f                   	pop    %edi
     c0e:	5d                   	pop    %ebp
     c0f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c10:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c13:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c15:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c19:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c1c:	5b                   	pop    %ebx
     c1d:	5e                   	pop    %esi
     c1e:	5f                   	pop    %edi
     c1f:	5d                   	pop    %ebp
     c20:	c3                   	ret    
     c21:	eb 0d                	jmp    c30 <stat>
     c23:	90                   	nop
     c24:	90                   	nop
     c25:	90                   	nop
     c26:	90                   	nop
     c27:	90                   	nop
     c28:	90                   	nop
     c29:	90                   	nop
     c2a:	90                   	nop
     c2b:	90                   	nop
     c2c:	90                   	nop
     c2d:	90                   	nop
     c2e:	90                   	nop
     c2f:	90                   	nop

00000c30 <stat>:

int
stat(char *n, struct stat *st)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	56                   	push   %esi
     c34:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c35:	83 ec 08             	sub    $0x8,%esp
     c38:	6a 00                	push   $0x0
     c3a:	ff 75 08             	pushl  0x8(%ebp)
     c3d:	e8 f0 00 00 00       	call   d32 <open>
  if(fd < 0)
     c42:	83 c4 10             	add    $0x10,%esp
     c45:	85 c0                	test   %eax,%eax
     c47:	78 27                	js     c70 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     c49:	83 ec 08             	sub    $0x8,%esp
     c4c:	ff 75 0c             	pushl  0xc(%ebp)
     c4f:	89 c3                	mov    %eax,%ebx
     c51:	50                   	push   %eax
     c52:	e8 f3 00 00 00       	call   d4a <fstat>
     c57:	89 c6                	mov    %eax,%esi
  close(fd);
     c59:	89 1c 24             	mov    %ebx,(%esp)
     c5c:	e8 b9 00 00 00       	call   d1a <close>
  return r;
     c61:	83 c4 10             	add    $0x10,%esp
     c64:	89 f0                	mov    %esi,%eax
}
     c66:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c69:	5b                   	pop    %ebx
     c6a:	5e                   	pop    %esi
     c6b:	5d                   	pop    %ebp
     c6c:	c3                   	ret    
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     c70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     c75:	eb ef                	jmp    c66 <stat+0x36>
     c77:	89 f6                	mov    %esi,%esi
     c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c80 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	53                   	push   %ebx
     c84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c87:	0f be 11             	movsbl (%ecx),%edx
     c8a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c8d:	3c 09                	cmp    $0x9,%al
     c8f:	b8 00 00 00 00       	mov    $0x0,%eax
     c94:	77 1f                	ja     cb5 <atoi+0x35>
     c96:	8d 76 00             	lea    0x0(%esi),%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     ca0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     ca3:	83 c1 01             	add    $0x1,%ecx
     ca6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     caa:	0f be 11             	movsbl (%ecx),%edx
     cad:	8d 5a d0             	lea    -0x30(%edx),%ebx
     cb0:	80 fb 09             	cmp    $0x9,%bl
     cb3:	76 eb                	jbe    ca0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     cb5:	5b                   	pop    %ebx
     cb6:	5d                   	pop    %ebp
     cb7:	c3                   	ret    
     cb8:	90                   	nop
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	56                   	push   %esi
     cc4:	53                   	push   %ebx
     cc5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     cc8:	8b 45 08             	mov    0x8(%ebp),%eax
     ccb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     cce:	85 db                	test   %ebx,%ebx
     cd0:	7e 14                	jle    ce6 <memmove+0x26>
     cd2:	31 d2                	xor    %edx,%edx
     cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     cd8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     cdc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     cdf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ce2:	39 da                	cmp    %ebx,%edx
     ce4:	75 f2                	jne    cd8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     ce6:	5b                   	pop    %ebx
     ce7:	5e                   	pop    %esi
     ce8:	5d                   	pop    %ebp
     ce9:	c3                   	ret    

00000cea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     cea:	b8 01 00 00 00       	mov    $0x1,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <exit>:
SYSCALL(exit)
     cf2:	b8 02 00 00 00       	mov    $0x2,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <wait>:
SYSCALL(wait)
     cfa:	b8 03 00 00 00       	mov    $0x3,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <pipe>:
SYSCALL(pipe)
     d02:	b8 04 00 00 00       	mov    $0x4,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <read>:
SYSCALL(read)
     d0a:	b8 05 00 00 00       	mov    $0x5,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <write>:
SYSCALL(write)
     d12:	b8 10 00 00 00       	mov    $0x10,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <close>:
SYSCALL(close)
     d1a:	b8 15 00 00 00       	mov    $0x15,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <kill>:
SYSCALL(kill)
     d22:	b8 06 00 00 00       	mov    $0x6,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <exec>:
SYSCALL(exec)
     d2a:	b8 07 00 00 00       	mov    $0x7,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <open>:
SYSCALL(open)
     d32:	b8 0f 00 00 00       	mov    $0xf,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <mknod>:
SYSCALL(mknod)
     d3a:	b8 11 00 00 00       	mov    $0x11,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <unlink>:
SYSCALL(unlink)
     d42:	b8 12 00 00 00       	mov    $0x12,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <fstat>:
SYSCALL(fstat)
     d4a:	b8 08 00 00 00       	mov    $0x8,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <link>:
SYSCALL(link)
     d52:	b8 13 00 00 00       	mov    $0x13,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <mkdir>:
SYSCALL(mkdir)
     d5a:	b8 14 00 00 00       	mov    $0x14,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <chdir>:
SYSCALL(chdir)
     d62:	b8 09 00 00 00       	mov    $0x9,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <dup>:
SYSCALL(dup)
     d6a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <getpid>:
SYSCALL(getpid)
     d72:	b8 0b 00 00 00       	mov    $0xb,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <sbrk>:
SYSCALL(sbrk)
     d7a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <sleep>:
SYSCALL(sleep)
     d82:	b8 0d 00 00 00       	mov    $0xd,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <uptime>:
SYSCALL(uptime)
     d8a:	b8 0e 00 00 00       	mov    $0xe,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    
     d92:	66 90                	xchg   %ax,%ax
     d94:	66 90                	xchg   %ax,%ax
     d96:	66 90                	xchg   %ax,%ax
     d98:	66 90                	xchg   %ax,%ax
     d9a:	66 90                	xchg   %ax,%ax
     d9c:	66 90                	xchg   %ax,%ax
     d9e:	66 90                	xchg   %ax,%ax

00000da0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
     da5:	53                   	push   %ebx
     da6:	89 c6                	mov    %eax,%esi
     da8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     dab:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dae:	85 db                	test   %ebx,%ebx
     db0:	74 7e                	je     e30 <printint+0x90>
     db2:	89 d0                	mov    %edx,%eax
     db4:	c1 e8 1f             	shr    $0x1f,%eax
     db7:	84 c0                	test   %al,%al
     db9:	74 75                	je     e30 <printint+0x90>
    neg = 1;
    x = -xx;
     dbb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     dbd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     dc4:	f7 d8                	neg    %eax
     dc6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     dc9:	31 ff                	xor    %edi,%edi
     dcb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     dce:	89 ce                	mov    %ecx,%esi
     dd0:	eb 08                	jmp    dda <printint+0x3a>
     dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     dd8:	89 cf                	mov    %ecx,%edi
     dda:	31 d2                	xor    %edx,%edx
     ddc:	8d 4f 01             	lea    0x1(%edi),%ecx
     ddf:	f7 f6                	div    %esi
     de1:	0f b6 92 50 12 00 00 	movzbl 0x1250(%edx),%edx
  }while((x /= base) != 0);
     de8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     dea:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     ded:	75 e9                	jne    dd8 <printint+0x38>
  if(neg)
     def:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     df2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     df5:	85 c0                	test   %eax,%eax
     df7:	74 08                	je     e01 <printint+0x61>
    buf[i++] = '-';
     df9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     dfe:	8d 4f 02             	lea    0x2(%edi),%ecx
     e01:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     e05:	8d 76 00             	lea    0x0(%esi),%esi
     e08:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e0b:	83 ec 04             	sub    $0x4,%esp
     e0e:	83 ef 01             	sub    $0x1,%edi
     e11:	6a 01                	push   $0x1
     e13:	53                   	push   %ebx
     e14:	56                   	push   %esi
     e15:	88 45 d7             	mov    %al,-0x29(%ebp)
     e18:	e8 f5 fe ff ff       	call   d12 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     e1d:	83 c4 10             	add    $0x10,%esp
     e20:	39 df                	cmp    %ebx,%edi
     e22:	75 e4                	jne    e08 <printint+0x68>
    putc(fd, buf[i]);
}
     e24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e27:	5b                   	pop    %ebx
     e28:	5e                   	pop    %esi
     e29:	5f                   	pop    %edi
     e2a:	5d                   	pop    %ebp
     e2b:	c3                   	ret    
     e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     e30:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     e32:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e39:	eb 8b                	jmp    dc6 <printint+0x26>
     e3b:	90                   	nop
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e40 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e46:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e49:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e4c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e4f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e52:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e55:	0f b6 1e             	movzbl (%esi),%ebx
     e58:	83 c6 01             	add    $0x1,%esi
     e5b:	84 db                	test   %bl,%bl
     e5d:	0f 84 b0 00 00 00    	je     f13 <printf+0xd3>
     e63:	31 d2                	xor    %edx,%edx
     e65:	eb 39                	jmp    ea0 <printf+0x60>
     e67:	89 f6                	mov    %esi,%esi
     e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e70:	83 f8 25             	cmp    $0x25,%eax
     e73:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     e76:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e7b:	74 18                	je     e95 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e7d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     e80:	83 ec 04             	sub    $0x4,%esp
     e83:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     e86:	6a 01                	push   $0x1
     e88:	50                   	push   %eax
     e89:	57                   	push   %edi
     e8a:	e8 83 fe ff ff       	call   d12 <write>
     e8f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e92:	83 c4 10             	add    $0x10,%esp
     e95:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e98:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     e9c:	84 db                	test   %bl,%bl
     e9e:	74 73                	je     f13 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     ea0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     ea2:	0f be cb             	movsbl %bl,%ecx
     ea5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     ea8:	74 c6                	je     e70 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     eaa:	83 fa 25             	cmp    $0x25,%edx
     ead:	75 e6                	jne    e95 <printf+0x55>
      if(c == 'd'){
     eaf:	83 f8 64             	cmp    $0x64,%eax
     eb2:	0f 84 f8 00 00 00    	je     fb0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     eb8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     ebe:	83 f9 70             	cmp    $0x70,%ecx
     ec1:	74 5d                	je     f20 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     ec3:	83 f8 73             	cmp    $0x73,%eax
     ec6:	0f 84 84 00 00 00    	je     f50 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     ecc:	83 f8 63             	cmp    $0x63,%eax
     ecf:	0f 84 ea 00 00 00    	je     fbf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     ed5:	83 f8 25             	cmp    $0x25,%eax
     ed8:	0f 84 c2 00 00 00    	je     fa0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ede:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ee1:	83 ec 04             	sub    $0x4,%esp
     ee4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     ee8:	6a 01                	push   $0x1
     eea:	50                   	push   %eax
     eeb:	57                   	push   %edi
     eec:	e8 21 fe ff ff       	call   d12 <write>
     ef1:	83 c4 0c             	add    $0xc,%esp
     ef4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     ef7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     efa:	6a 01                	push   $0x1
     efc:	50                   	push   %eax
     efd:	57                   	push   %edi
     efe:	83 c6 01             	add    $0x1,%esi
     f01:	e8 0c fe ff ff       	call   d12 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f06:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f0a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f0d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f0f:	84 db                	test   %bl,%bl
     f11:	75 8d                	jne    ea0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f13:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f16:	5b                   	pop    %ebx
     f17:	5e                   	pop    %esi
     f18:	5f                   	pop    %edi
     f19:	5d                   	pop    %ebp
     f1a:	c3                   	ret    
     f1b:	90                   	nop
     f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     f20:	83 ec 0c             	sub    $0xc,%esp
     f23:	b9 10 00 00 00       	mov    $0x10,%ecx
     f28:	6a 00                	push   $0x0
     f2a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f2d:	89 f8                	mov    %edi,%eax
     f2f:	8b 13                	mov    (%ebx),%edx
     f31:	e8 6a fe ff ff       	call   da0 <printint>
        ap++;
     f36:	89 d8                	mov    %ebx,%eax
     f38:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f3b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     f3d:	83 c0 04             	add    $0x4,%eax
     f40:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f43:	e9 4d ff ff ff       	jmp    e95 <printf+0x55>
     f48:	90                   	nop
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     f50:	8b 45 d0             	mov    -0x30(%ebp),%eax
     f53:	8b 18                	mov    (%eax),%ebx
        ap++;
     f55:	83 c0 04             	add    $0x4,%eax
     f58:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     f5b:	b8 48 12 00 00       	mov    $0x1248,%eax
     f60:	85 db                	test   %ebx,%ebx
     f62:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     f65:	0f b6 03             	movzbl (%ebx),%eax
     f68:	84 c0                	test   %al,%al
     f6a:	74 23                	je     f8f <printf+0x14f>
     f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f70:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f73:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     f76:	83 ec 04             	sub    $0x4,%esp
     f79:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     f7b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f7e:	50                   	push   %eax
     f7f:	57                   	push   %edi
     f80:	e8 8d fd ff ff       	call   d12 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     f85:	0f b6 03             	movzbl (%ebx),%eax
     f88:	83 c4 10             	add    $0x10,%esp
     f8b:	84 c0                	test   %al,%al
     f8d:	75 e1                	jne    f70 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f8f:	31 d2                	xor    %edx,%edx
     f91:	e9 ff fe ff ff       	jmp    e95 <printf+0x55>
     f96:	8d 76 00             	lea    0x0(%esi),%esi
     f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fa0:	83 ec 04             	sub    $0x4,%esp
     fa3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     fa6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     fa9:	6a 01                	push   $0x1
     fab:	e9 4c ff ff ff       	jmp    efc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     fb0:	83 ec 0c             	sub    $0xc,%esp
     fb3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fb8:	6a 01                	push   $0x1
     fba:	e9 6b ff ff ff       	jmp    f2a <printf+0xea>
     fbf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fc2:	83 ec 04             	sub    $0x4,%esp
     fc5:	8b 03                	mov    (%ebx),%eax
     fc7:	6a 01                	push   $0x1
     fc9:	88 45 e4             	mov    %al,-0x1c(%ebp)
     fcc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     fcf:	50                   	push   %eax
     fd0:	57                   	push   %edi
     fd1:	e8 3c fd ff ff       	call   d12 <write>
     fd6:	e9 5b ff ff ff       	jmp    f36 <printf+0xf6>
     fdb:	66 90                	xchg   %ax,%ax
     fdd:	66 90                	xchg   %ax,%ax
     fdf:	90                   	nop

00000fe0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fe0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fe1:	a1 84 18 00 00       	mov    0x1884,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     fe6:	89 e5                	mov    %esp,%ebp
     fe8:	57                   	push   %edi
     fe9:	56                   	push   %esi
     fea:	53                   	push   %ebx
     feb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fee:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ff0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ff3:	39 c8                	cmp    %ecx,%eax
     ff5:	73 19                	jae    1010 <free+0x30>
     ff7:	89 f6                	mov    %esi,%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1000:	39 d1                	cmp    %edx,%ecx
    1002:	72 1c                	jb     1020 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1004:	39 d0                	cmp    %edx,%eax
    1006:	73 18                	jae    1020 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1008:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    100a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    100c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    100e:	72 f0                	jb     1000 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1010:	39 d0                	cmp    %edx,%eax
    1012:	72 f4                	jb     1008 <free+0x28>
    1014:	39 d1                	cmp    %edx,%ecx
    1016:	73 f0                	jae    1008 <free+0x28>
    1018:	90                   	nop
    1019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1020:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1023:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1026:	39 d7                	cmp    %edx,%edi
    1028:	74 19                	je     1043 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    102a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    102d:	8b 50 04             	mov    0x4(%eax),%edx
    1030:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1033:	39 f1                	cmp    %esi,%ecx
    1035:	74 23                	je     105a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1037:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1039:	a3 84 18 00 00       	mov    %eax,0x1884
}
    103e:	5b                   	pop    %ebx
    103f:	5e                   	pop    %esi
    1040:	5f                   	pop    %edi
    1041:	5d                   	pop    %ebp
    1042:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1043:	03 72 04             	add    0x4(%edx),%esi
    1046:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1049:	8b 10                	mov    (%eax),%edx
    104b:	8b 12                	mov    (%edx),%edx
    104d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1050:	8b 50 04             	mov    0x4(%eax),%edx
    1053:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1056:	39 f1                	cmp    %esi,%ecx
    1058:	75 dd                	jne    1037 <free+0x57>
    p->s.size += bp->s.size;
    105a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    105d:	a3 84 18 00 00       	mov    %eax,0x1884
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1062:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1065:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1068:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    106a:	5b                   	pop    %ebx
    106b:	5e                   	pop    %esi
    106c:	5f                   	pop    %edi
    106d:	5d                   	pop    %ebp
    106e:	c3                   	ret    
    106f:	90                   	nop

00001070 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	57                   	push   %edi
    1074:	56                   	push   %esi
    1075:	53                   	push   %ebx
    1076:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1079:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    107c:	8b 15 84 18 00 00    	mov    0x1884,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1082:	8d 78 07             	lea    0x7(%eax),%edi
    1085:	c1 ef 03             	shr    $0x3,%edi
    1088:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    108b:	85 d2                	test   %edx,%edx
    108d:	0f 84 a3 00 00 00    	je     1136 <malloc+0xc6>
    1093:	8b 02                	mov    (%edx),%eax
    1095:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1098:	39 cf                	cmp    %ecx,%edi
    109a:	76 74                	jbe    1110 <malloc+0xa0>
    109c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    10a2:	be 00 10 00 00       	mov    $0x1000,%esi
    10a7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    10ae:	0f 43 f7             	cmovae %edi,%esi
    10b1:	ba 00 80 00 00       	mov    $0x8000,%edx
    10b6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    10bc:	0f 46 da             	cmovbe %edx,%ebx
    10bf:	eb 10                	jmp    10d1 <malloc+0x61>
    10c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    10ca:	8b 48 04             	mov    0x4(%eax),%ecx
    10cd:	39 cf                	cmp    %ecx,%edi
    10cf:	76 3f                	jbe    1110 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    10d1:	39 05 84 18 00 00    	cmp    %eax,0x1884
    10d7:	89 c2                	mov    %eax,%edx
    10d9:	75 ed                	jne    10c8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    10db:	83 ec 0c             	sub    $0xc,%esp
    10de:	53                   	push   %ebx
    10df:	e8 96 fc ff ff       	call   d7a <sbrk>
  if(p == (char*)-1)
    10e4:	83 c4 10             	add    $0x10,%esp
    10e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    10ea:	74 1c                	je     1108 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    10ec:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    10ef:	83 ec 0c             	sub    $0xc,%esp
    10f2:	83 c0 08             	add    $0x8,%eax
    10f5:	50                   	push   %eax
    10f6:	e8 e5 fe ff ff       	call   fe0 <free>
  return freep;
    10fb:	8b 15 84 18 00 00    	mov    0x1884,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1101:	83 c4 10             	add    $0x10,%esp
    1104:	85 d2                	test   %edx,%edx
    1106:	75 c0                	jne    10c8 <malloc+0x58>
        return 0;
    1108:	31 c0                	xor    %eax,%eax
    110a:	eb 1c                	jmp    1128 <malloc+0xb8>
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1110:	39 cf                	cmp    %ecx,%edi
    1112:	74 1c                	je     1130 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1114:	29 f9                	sub    %edi,%ecx
    1116:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1119:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    111c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    111f:	89 15 84 18 00 00    	mov    %edx,0x1884
      return (void*)(p + 1);
    1125:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1128:	8d 65 f4             	lea    -0xc(%ebp),%esp
    112b:	5b                   	pop    %ebx
    112c:	5e                   	pop    %esi
    112d:	5f                   	pop    %edi
    112e:	5d                   	pop    %ebp
    112f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1130:	8b 08                	mov    (%eax),%ecx
    1132:	89 0a                	mov    %ecx,(%edx)
    1134:	eb e9                	jmp    111f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1136:	c7 05 84 18 00 00 88 	movl   $0x1888,0x1884
    113d:	18 00 00 
    1140:	c7 05 88 18 00 00 88 	movl   $0x1888,0x1888
    1147:	18 00 00 
    base.s.size = 0;
    114a:	b8 88 18 00 00       	mov    $0x1888,%eax
    114f:	c7 05 8c 18 00 00 00 	movl   $0x0,0x188c
    1156:	00 00 00 
    1159:	e9 3e ff ff ff       	jmp    109c <malloc+0x2c>
