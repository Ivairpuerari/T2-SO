
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 57 0f 00 00       	call   f68 <exit>
  
  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 e0 14 00 00 	mov    0x14e0(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 b4 14 00 00 	movl   $0x14b4,(%esp)
      2b:	e8 27 03 00 00       	call   357 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 f4             	mov    -0xc(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 23 0f 00 00       	call   f68 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 f4             	mov    -0xc(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 43 0f 00 00       	call   fa0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 bb 14 00 	movl   $0x14bb,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 6d 10 00 00       	call   10e8 <printf>
    break;
      7b:	e9 86 01 00 00       	jmp    206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 fc 0e 00 00       	call   f90 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 fc 0e 00 00       	call   fa8 <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 cb 14 00 	movl   $0x14cb,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 1a 10 00 00       	call   10e8 <printf>
      exit();
      ce:	e8 95 0e 00 00       	call   f68 <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 20 01 00 00       	jmp    206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 8c 02 00 00       	call   37d <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 68 0e 00 00       	call   f70 <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 eb 00 00 00       	jmp    206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 4c 0e 00 00       	call   f78 <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 db 14 00 00 	movl   $0x14db,(%esp)
     137:	e8 1b 02 00 00       	call   357 <panic>
    if(fork1() == 0){
     13c:	e8 3c 02 00 00       	call   37d <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 3f 0e 00 00       	call   f90 <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 84 0e 00 00       	call   fe0 <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 29 0e 00 00       	call   f90 <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 1e 0e 00 00       	call   f90 <close>
      runcmd(pcmd->left);
     172:	8b 45 e8             	mov    -0x18(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 f8 01 00 00       	call   37d <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 fb 0d 00 00       	call   f90 <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 40 0e 00 00       	call   fe0 <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 e5 0d 00 00       	call   f90 <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 da 0d 00 00       	call   f90 <close>
      runcmd(pcmd->right);
     1b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 c1 0d 00 00       	call   f90 <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 b6 0d 00 00       	call   f90 <close>
    wait();
     1da:	e8 91 0d 00 00       	call   f70 <wait>
    wait();
     1df:	e8 8c 0d 00 00       	call   f70 <wait>
    break;
     1e4:	eb 20                	jmp    206 <runcmd+0x206>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 8c 01 00 00       	call   37d <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 10                	jne    205 <runcmd+0x205>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
     203:	eb 00                	jmp    205 <runcmd+0x205>
     205:	90                   	nop
  }
  exit();
     206:	e8 5d 0d 00 00       	call   f68 <exit>

0000020b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     20b:	55                   	push   %ebp
     20c:	89 e5                	mov    %esp,%ebp
     20e:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     211:	c7 44 24 04 f8 14 00 	movl   $0x14f8,0x4(%esp)
     218:	00 
     219:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     220:	e8 c3 0e 00 00       	call   10e8 <printf>
  memset(buf, 0, nbuf);
     225:	8b 45 0c             	mov    0xc(%ebp),%eax
     228:	89 44 24 08          	mov    %eax,0x8(%esp)
     22c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     233:	00 
     234:	8b 45 08             	mov    0x8(%ebp),%eax
     237:	89 04 24             	mov    %eax,(%esp)
     23a:	e8 7c 0b 00 00       	call   dbb <memset>
  gets(buf, nbuf);
     23f:	8b 45 0c             	mov    0xc(%ebp),%eax
     242:	89 44 24 04          	mov    %eax,0x4(%esp)
     246:	8b 45 08             	mov    0x8(%ebp),%eax
     249:	89 04 24             	mov    %eax,(%esp)
     24c:	e8 c1 0b 00 00       	call   e12 <gets>
  if(buf[0] == 0) // EOF
     251:	8b 45 08             	mov    0x8(%ebp),%eax
     254:	0f b6 00             	movzbl (%eax),%eax
     257:	84 c0                	test   %al,%al
     259:	75 07                	jne    262 <getcmd+0x57>
    return -1;
     25b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     260:	eb 05                	jmp    267 <getcmd+0x5c>
  return 0;
     262:	b8 00 00 00 00       	mov    $0x0,%eax
}
     267:	c9                   	leave  
     268:	c3                   	ret    

00000269 <main>:

int
main(void)
{
     269:	55                   	push   %ebp
     26a:	89 e5                	mov    %esp,%ebp
     26c:	83 e4 f0             	and    $0xfffffff0,%esp
     26f:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     272:	eb 15                	jmp    289 <main+0x20>
    if(fd >= 3){
     274:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     279:	7e 0e                	jle    289 <main+0x20>
      close(fd);
     27b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     27f:	89 04 24             	mov    %eax,(%esp)
     282:	e8 09 0d 00 00       	call   f90 <close>
      break;
     287:	eb 1f                	jmp    2a8 <main+0x3f>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     289:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     290:	00 
     291:	c7 04 24 fb 14 00 00 	movl   $0x14fb,(%esp)
     298:	e8 0b 0d 00 00       	call   fa8 <open>
     29d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2a6:	79 cc                	jns    274 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2a8:	e9 89 00 00 00       	jmp    336 <main+0xcd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2ad:	0f b6 05 60 1a 00 00 	movzbl 0x1a60,%eax
     2b4:	3c 63                	cmp    $0x63,%al
     2b6:	75 5c                	jne    314 <main+0xab>
     2b8:	0f b6 05 61 1a 00 00 	movzbl 0x1a61,%eax
     2bf:	3c 64                	cmp    $0x64,%al
     2c1:	75 51                	jne    314 <main+0xab>
     2c3:	0f b6 05 62 1a 00 00 	movzbl 0x1a62,%eax
     2ca:	3c 20                	cmp    $0x20,%al
     2cc:	75 46                	jne    314 <main+0xab>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2ce:	c7 04 24 60 1a 00 00 	movl   $0x1a60,(%esp)
     2d5:	e8 ba 0a 00 00       	call   d94 <strlen>
     2da:	83 e8 01             	sub    $0x1,%eax
     2dd:	c6 80 60 1a 00 00 00 	movb   $0x0,0x1a60(%eax)
      if(chdir(buf+3) < 0)
     2e4:	c7 04 24 63 1a 00 00 	movl   $0x1a63,(%esp)
     2eb:	e8 e8 0c 00 00       	call   fd8 <chdir>
     2f0:	85 c0                	test   %eax,%eax
     2f2:	79 1e                	jns    312 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
     2f4:	c7 44 24 08 63 1a 00 	movl   $0x1a63,0x8(%esp)
     2fb:	00 
     2fc:	c7 44 24 04 03 15 00 	movl   $0x1503,0x4(%esp)
     303:	00 
     304:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     30b:	e8 d8 0d 00 00       	call   10e8 <printf>
      continue;
     310:	eb 24                	jmp    336 <main+0xcd>
     312:	eb 22                	jmp    336 <main+0xcd>
    }
    if(fork1() == 0)
     314:	e8 64 00 00 00       	call   37d <fork1>
     319:	85 c0                	test   %eax,%eax
     31b:	75 14                	jne    331 <main+0xc8>
      runcmd(parsecmd(buf));
     31d:	c7 04 24 60 1a 00 00 	movl   $0x1a60,(%esp)
     324:	e8 d0 03 00 00       	call   6f9 <parsecmd>
     329:	89 04 24             	mov    %eax,(%esp)
     32c:	e8 cf fc ff ff       	call   0 <runcmd>
    wait();
     331:	e8 3a 0c 00 00       	call   f70 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     336:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     33d:	00 
     33e:	c7 04 24 60 1a 00 00 	movl   $0x1a60,(%esp)
     345:	e8 c1 fe ff ff       	call   20b <getcmd>
     34a:	85 c0                	test   %eax,%eax
     34c:	0f 89 5b ff ff ff    	jns    2ad <main+0x44>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     352:	e8 11 0c 00 00       	call   f68 <exit>

00000357 <panic>:
}

void
panic(char *s)
{
     357:	55                   	push   %ebp
     358:	89 e5                	mov    %esp,%ebp
     35a:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
     360:	89 44 24 08          	mov    %eax,0x8(%esp)
     364:	c7 44 24 04 11 15 00 	movl   $0x1511,0x4(%esp)
     36b:	00 
     36c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     373:	e8 70 0d 00 00       	call   10e8 <printf>
  exit();
     378:	e8 eb 0b 00 00       	call   f68 <exit>

0000037d <fork1>:
}

int
fork1(void)
{
     37d:	55                   	push   %ebp
     37e:	89 e5                	mov    %esp,%ebp
     380:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork(500);
     383:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
     38a:	e8 d1 0b 00 00       	call   f60 <fork>
     38f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     392:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     396:	75 0c                	jne    3a4 <fork1+0x27>
    panic("fork");
     398:	c7 04 24 15 15 00 00 	movl   $0x1515,(%esp)
     39f:	e8 b3 ff ff ff       	call   357 <panic>
  return pid;
     3a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3a7:	c9                   	leave  
     3a8:	c3                   	ret    

000003a9 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3a9:	55                   	push   %ebp
     3aa:	89 e5                	mov    %esp,%ebp
     3ac:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3af:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3b6:	e8 19 10 00 00       	call   13d4 <malloc>
     3bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3be:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3c5:	00 
     3c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3cd:	00 
     3ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d1:	89 04 24             	mov    %eax,(%esp)
     3d4:	e8 e2 09 00 00       	call   dbb <memset>
  cmd->type = EXEC;
     3d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3dc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     3e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3e5:	c9                   	leave  
     3e6:	c3                   	ret    

000003e7 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e7:	55                   	push   %ebp
     3e8:	89 e5                	mov    %esp,%ebp
     3ea:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3ed:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3f4:	e8 db 0f 00 00       	call   13d4 <malloc>
     3f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3fc:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     403:	00 
     404:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     40b:	00 
     40c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40f:	89 04 24             	mov    %eax,(%esp)
     412:	e8 a4 09 00 00       	call   dbb <memset>
  cmd->type = REDIR;
     417:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41a:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     420:	8b 45 f4             	mov    -0xc(%ebp),%eax
     423:	8b 55 08             	mov    0x8(%ebp),%edx
     426:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     429:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42c:	8b 55 0c             	mov    0xc(%ebp),%edx
     42f:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     432:	8b 45 f4             	mov    -0xc(%ebp),%eax
     435:	8b 55 10             	mov    0x10(%ebp),%edx
     438:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     43b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     43e:	8b 55 14             	mov    0x14(%ebp),%edx
     441:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     444:	8b 45 f4             	mov    -0xc(%ebp),%eax
     447:	8b 55 18             	mov    0x18(%ebp),%edx
     44a:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     44d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     450:	c9                   	leave  
     451:	c3                   	ret    

00000452 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     452:	55                   	push   %ebp
     453:	89 e5                	mov    %esp,%ebp
     455:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     458:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     45f:	e8 70 0f 00 00       	call   13d4 <malloc>
     464:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     467:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     46e:	00 
     46f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     476:	00 
     477:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47a:	89 04 24             	mov    %eax,(%esp)
     47d:	e8 39 09 00 00       	call   dbb <memset>
  cmd->type = PIPE;
     482:	8b 45 f4             	mov    -0xc(%ebp),%eax
     485:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     48b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     48e:	8b 55 08             	mov    0x8(%ebp),%edx
     491:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     494:	8b 45 f4             	mov    -0xc(%ebp),%eax
     497:	8b 55 0c             	mov    0xc(%ebp),%edx
     49a:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     49d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4a0:	c9                   	leave  
     4a1:	c3                   	ret    

000004a2 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4a2:	55                   	push   %ebp
     4a3:	89 e5                	mov    %esp,%ebp
     4a5:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4af:	e8 20 0f 00 00       	call   13d4 <malloc>
     4b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4b7:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4be:	00 
     4bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4c6:	00 
     4c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ca:	89 04 24             	mov    %eax,(%esp)
     4cd:	e8 e9 08 00 00       	call   dbb <memset>
  cmd->type = LIST;
     4d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d5:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4db:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4de:	8b 55 08             	mov    0x8(%ebp),%edx
     4e1:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e7:	8b 55 0c             	mov    0xc(%ebp),%edx
     4ea:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4f0:	c9                   	leave  
     4f1:	c3                   	ret    

000004f2 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4f2:	55                   	push   %ebp
     4f3:	89 e5                	mov    %esp,%ebp
     4f5:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4ff:	e8 d0 0e 00 00       	call   13d4 <malloc>
     504:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     507:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     50e:	00 
     50f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     516:	00 
     517:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51a:	89 04 24             	mov    %eax,(%esp)
     51d:	e8 99 08 00 00       	call   dbb <memset>
  cmd->type = BACK;
     522:	8b 45 f4             	mov    -0xc(%ebp),%eax
     525:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     52e:	8b 55 08             	mov    0x8(%ebp),%edx
     531:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     534:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     537:	c9                   	leave  
     538:	c3                   	ret    

00000539 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     539:	55                   	push   %ebp
     53a:	89 e5                	mov    %esp,%ebp
     53c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     53f:	8b 45 08             	mov    0x8(%ebp),%eax
     542:	8b 00                	mov    (%eax),%eax
     544:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     547:	eb 04                	jmp    54d <gettoken+0x14>
    s++;
     549:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     54d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     550:	3b 45 0c             	cmp    0xc(%ebp),%eax
     553:	73 1d                	jae    572 <gettoken+0x39>
     555:	8b 45 f4             	mov    -0xc(%ebp),%eax
     558:	0f b6 00             	movzbl (%eax),%eax
     55b:	0f be c0             	movsbl %al,%eax
     55e:	89 44 24 04          	mov    %eax,0x4(%esp)
     562:	c7 04 24 2c 1a 00 00 	movl   $0x1a2c,(%esp)
     569:	e8 71 08 00 00       	call   ddf <strchr>
     56e:	85 c0                	test   %eax,%eax
     570:	75 d7                	jne    549 <gettoken+0x10>
    s++;
  if(q)
     572:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     576:	74 08                	je     580 <gettoken+0x47>
    *q = s;
     578:	8b 45 10             	mov    0x10(%ebp),%eax
     57b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     57e:	89 10                	mov    %edx,(%eax)
  ret = *s;
     580:	8b 45 f4             	mov    -0xc(%ebp),%eax
     583:	0f b6 00             	movzbl (%eax),%eax
     586:	0f be c0             	movsbl %al,%eax
     589:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     58c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     58f:	0f b6 00             	movzbl (%eax),%eax
     592:	0f be c0             	movsbl %al,%eax
     595:	83 f8 29             	cmp    $0x29,%eax
     598:	7f 14                	jg     5ae <gettoken+0x75>
     59a:	83 f8 28             	cmp    $0x28,%eax
     59d:	7d 28                	jge    5c7 <gettoken+0x8e>
     59f:	85 c0                	test   %eax,%eax
     5a1:	0f 84 94 00 00 00    	je     63b <gettoken+0x102>
     5a7:	83 f8 26             	cmp    $0x26,%eax
     5aa:	74 1b                	je     5c7 <gettoken+0x8e>
     5ac:	eb 3c                	jmp    5ea <gettoken+0xb1>
     5ae:	83 f8 3e             	cmp    $0x3e,%eax
     5b1:	74 1a                	je     5cd <gettoken+0x94>
     5b3:	83 f8 3e             	cmp    $0x3e,%eax
     5b6:	7f 0a                	jg     5c2 <gettoken+0x89>
     5b8:	83 e8 3b             	sub    $0x3b,%eax
     5bb:	83 f8 01             	cmp    $0x1,%eax
     5be:	77 2a                	ja     5ea <gettoken+0xb1>
     5c0:	eb 05                	jmp    5c7 <gettoken+0x8e>
     5c2:	83 f8 7c             	cmp    $0x7c,%eax
     5c5:	75 23                	jne    5ea <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     5cb:	eb 6f                	jmp    63c <gettoken+0x103>
  case '>':
    s++;
     5cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     5d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5d4:	0f b6 00             	movzbl (%eax),%eax
     5d7:	3c 3e                	cmp    $0x3e,%al
     5d9:	75 0d                	jne    5e8 <gettoken+0xaf>
      ret = '+';
     5db:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     5e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     5e6:	eb 54                	jmp    63c <gettoken+0x103>
     5e8:	eb 52                	jmp    63c <gettoken+0x103>
  default:
    ret = 'a';
     5ea:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f1:	eb 04                	jmp    5f7 <gettoken+0xbe>
      s++;
     5f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
     5fd:	73 3a                	jae    639 <gettoken+0x100>
     5ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     602:	0f b6 00             	movzbl (%eax),%eax
     605:	0f be c0             	movsbl %al,%eax
     608:	89 44 24 04          	mov    %eax,0x4(%esp)
     60c:	c7 04 24 2c 1a 00 00 	movl   $0x1a2c,(%esp)
     613:	e8 c7 07 00 00       	call   ddf <strchr>
     618:	85 c0                	test   %eax,%eax
     61a:	75 1d                	jne    639 <gettoken+0x100>
     61c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     61f:	0f b6 00             	movzbl (%eax),%eax
     622:	0f be c0             	movsbl %al,%eax
     625:	89 44 24 04          	mov    %eax,0x4(%esp)
     629:	c7 04 24 32 1a 00 00 	movl   $0x1a32,(%esp)
     630:	e8 aa 07 00 00       	call   ddf <strchr>
     635:	85 c0                	test   %eax,%eax
     637:	74 ba                	je     5f3 <gettoken+0xba>
      s++;
    break;
     639:	eb 01                	jmp    63c <gettoken+0x103>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     63b:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     63c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     640:	74 0a                	je     64c <gettoken+0x113>
    *eq = s;
     642:	8b 45 14             	mov    0x14(%ebp),%eax
     645:	8b 55 f4             	mov    -0xc(%ebp),%edx
     648:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     64a:	eb 06                	jmp    652 <gettoken+0x119>
     64c:	eb 04                	jmp    652 <gettoken+0x119>
    s++;
     64e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     652:	8b 45 f4             	mov    -0xc(%ebp),%eax
     655:	3b 45 0c             	cmp    0xc(%ebp),%eax
     658:	73 1d                	jae    677 <gettoken+0x13e>
     65a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     65d:	0f b6 00             	movzbl (%eax),%eax
     660:	0f be c0             	movsbl %al,%eax
     663:	89 44 24 04          	mov    %eax,0x4(%esp)
     667:	c7 04 24 2c 1a 00 00 	movl   $0x1a2c,(%esp)
     66e:	e8 6c 07 00 00       	call   ddf <strchr>
     673:	85 c0                	test   %eax,%eax
     675:	75 d7                	jne    64e <gettoken+0x115>
    s++;
  *ps = s;
     677:	8b 45 08             	mov    0x8(%ebp),%eax
     67a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     67d:	89 10                	mov    %edx,(%eax)
  return ret;
     67f:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     682:	c9                   	leave  
     683:	c3                   	ret    

00000684 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     684:	55                   	push   %ebp
     685:	89 e5                	mov    %esp,%ebp
     687:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     68a:	8b 45 08             	mov    0x8(%ebp),%eax
     68d:	8b 00                	mov    (%eax),%eax
     68f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     692:	eb 04                	jmp    698 <peek+0x14>
    s++;
     694:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     698:	8b 45 f4             	mov    -0xc(%ebp),%eax
     69b:	3b 45 0c             	cmp    0xc(%ebp),%eax
     69e:	73 1d                	jae    6bd <peek+0x39>
     6a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6a3:	0f b6 00             	movzbl (%eax),%eax
     6a6:	0f be c0             	movsbl %al,%eax
     6a9:	89 44 24 04          	mov    %eax,0x4(%esp)
     6ad:	c7 04 24 2c 1a 00 00 	movl   $0x1a2c,(%esp)
     6b4:	e8 26 07 00 00       	call   ddf <strchr>
     6b9:	85 c0                	test   %eax,%eax
     6bb:	75 d7                	jne    694 <peek+0x10>
    s++;
  *ps = s;
     6bd:	8b 45 08             	mov    0x8(%ebp),%eax
     6c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6c3:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c8:	0f b6 00             	movzbl (%eax),%eax
     6cb:	84 c0                	test   %al,%al
     6cd:	74 23                	je     6f2 <peek+0x6e>
     6cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6d2:	0f b6 00             	movzbl (%eax),%eax
     6d5:	0f be c0             	movsbl %al,%eax
     6d8:	89 44 24 04          	mov    %eax,0x4(%esp)
     6dc:	8b 45 10             	mov    0x10(%ebp),%eax
     6df:	89 04 24             	mov    %eax,(%esp)
     6e2:	e8 f8 06 00 00       	call   ddf <strchr>
     6e7:	85 c0                	test   %eax,%eax
     6e9:	74 07                	je     6f2 <peek+0x6e>
     6eb:	b8 01 00 00 00       	mov    $0x1,%eax
     6f0:	eb 05                	jmp    6f7 <peek+0x73>
     6f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6f7:	c9                   	leave  
     6f8:	c3                   	ret    

000006f9 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     6f9:	55                   	push   %ebp
     6fa:	89 e5                	mov    %esp,%ebp
     6fc:	53                   	push   %ebx
     6fd:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     700:	8b 5d 08             	mov    0x8(%ebp),%ebx
     703:	8b 45 08             	mov    0x8(%ebp),%eax
     706:	89 04 24             	mov    %eax,(%esp)
     709:	e8 86 06 00 00       	call   d94 <strlen>
     70e:	01 d8                	add    %ebx,%eax
     710:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     713:	8b 45 f4             	mov    -0xc(%ebp),%eax
     716:	89 44 24 04          	mov    %eax,0x4(%esp)
     71a:	8d 45 08             	lea    0x8(%ebp),%eax
     71d:	89 04 24             	mov    %eax,(%esp)
     720:	e8 60 00 00 00       	call   785 <parseline>
     725:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     728:	c7 44 24 08 1a 15 00 	movl   $0x151a,0x8(%esp)
     72f:	00 
     730:	8b 45 f4             	mov    -0xc(%ebp),%eax
     733:	89 44 24 04          	mov    %eax,0x4(%esp)
     737:	8d 45 08             	lea    0x8(%ebp),%eax
     73a:	89 04 24             	mov    %eax,(%esp)
     73d:	e8 42 ff ff ff       	call   684 <peek>
  if(s != es){
     742:	8b 45 08             	mov    0x8(%ebp),%eax
     745:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     748:	74 27                	je     771 <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     74a:	8b 45 08             	mov    0x8(%ebp),%eax
     74d:	89 44 24 08          	mov    %eax,0x8(%esp)
     751:	c7 44 24 04 1b 15 00 	movl   $0x151b,0x4(%esp)
     758:	00 
     759:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     760:	e8 83 09 00 00       	call   10e8 <printf>
    panic("syntax");
     765:	c7 04 24 2a 15 00 00 	movl   $0x152a,(%esp)
     76c:	e8 e6 fb ff ff       	call   357 <panic>
  }
  nulterminate(cmd);
     771:	8b 45 f0             	mov    -0x10(%ebp),%eax
     774:	89 04 24             	mov    %eax,(%esp)
     777:	e8 a3 04 00 00       	call   c1f <nulterminate>
  return cmd;
     77c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     77f:	83 c4 24             	add    $0x24,%esp
     782:	5b                   	pop    %ebx
     783:	5d                   	pop    %ebp
     784:	c3                   	ret    

00000785 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     785:	55                   	push   %ebp
     786:	89 e5                	mov    %esp,%ebp
     788:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     78b:	8b 45 0c             	mov    0xc(%ebp),%eax
     78e:	89 44 24 04          	mov    %eax,0x4(%esp)
     792:	8b 45 08             	mov    0x8(%ebp),%eax
     795:	89 04 24             	mov    %eax,(%esp)
     798:	e8 bc 00 00 00       	call   859 <parsepipe>
     79d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7a0:	eb 30                	jmp    7d2 <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     7a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7a9:	00 
     7aa:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7b1:	00 
     7b2:	8b 45 0c             	mov    0xc(%ebp),%eax
     7b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     7b9:	8b 45 08             	mov    0x8(%ebp),%eax
     7bc:	89 04 24             	mov    %eax,(%esp)
     7bf:	e8 75 fd ff ff       	call   539 <gettoken>
    cmd = backcmd(cmd);
     7c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7c7:	89 04 24             	mov    %eax,(%esp)
     7ca:	e8 23 fd ff ff       	call   4f2 <backcmd>
     7cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     7d2:	c7 44 24 08 31 15 00 	movl   $0x1531,0x8(%esp)
     7d9:	00 
     7da:	8b 45 0c             	mov    0xc(%ebp),%eax
     7dd:	89 44 24 04          	mov    %eax,0x4(%esp)
     7e1:	8b 45 08             	mov    0x8(%ebp),%eax
     7e4:	89 04 24             	mov    %eax,(%esp)
     7e7:	e8 98 fe ff ff       	call   684 <peek>
     7ec:	85 c0                	test   %eax,%eax
     7ee:	75 b2                	jne    7a2 <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     7f0:	c7 44 24 08 33 15 00 	movl   $0x1533,0x8(%esp)
     7f7:	00 
     7f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7fb:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ff:	8b 45 08             	mov    0x8(%ebp),%eax
     802:	89 04 24             	mov    %eax,(%esp)
     805:	e8 7a fe ff ff       	call   684 <peek>
     80a:	85 c0                	test   %eax,%eax
     80c:	74 46                	je     854 <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     80e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     815:	00 
     816:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     81d:	00 
     81e:	8b 45 0c             	mov    0xc(%ebp),%eax
     821:	89 44 24 04          	mov    %eax,0x4(%esp)
     825:	8b 45 08             	mov    0x8(%ebp),%eax
     828:	89 04 24             	mov    %eax,(%esp)
     82b:	e8 09 fd ff ff       	call   539 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     830:	8b 45 0c             	mov    0xc(%ebp),%eax
     833:	89 44 24 04          	mov    %eax,0x4(%esp)
     837:	8b 45 08             	mov    0x8(%ebp),%eax
     83a:	89 04 24             	mov    %eax,(%esp)
     83d:	e8 43 ff ff ff       	call   785 <parseline>
     842:	89 44 24 04          	mov    %eax,0x4(%esp)
     846:	8b 45 f4             	mov    -0xc(%ebp),%eax
     849:	89 04 24             	mov    %eax,(%esp)
     84c:	e8 51 fc ff ff       	call   4a2 <listcmd>
     851:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     854:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     857:	c9                   	leave  
     858:	c3                   	ret    

00000859 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     859:	55                   	push   %ebp
     85a:	89 e5                	mov    %esp,%ebp
     85c:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     85f:	8b 45 0c             	mov    0xc(%ebp),%eax
     862:	89 44 24 04          	mov    %eax,0x4(%esp)
     866:	8b 45 08             	mov    0x8(%ebp),%eax
     869:	89 04 24             	mov    %eax,(%esp)
     86c:	e8 68 02 00 00       	call   ad9 <parseexec>
     871:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     874:	c7 44 24 08 35 15 00 	movl   $0x1535,0x8(%esp)
     87b:	00 
     87c:	8b 45 0c             	mov    0xc(%ebp),%eax
     87f:	89 44 24 04          	mov    %eax,0x4(%esp)
     883:	8b 45 08             	mov    0x8(%ebp),%eax
     886:	89 04 24             	mov    %eax,(%esp)
     889:	e8 f6 fd ff ff       	call   684 <peek>
     88e:	85 c0                	test   %eax,%eax
     890:	74 46                	je     8d8 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     892:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     899:	00 
     89a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8a1:	00 
     8a2:	8b 45 0c             	mov    0xc(%ebp),%eax
     8a5:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a9:	8b 45 08             	mov    0x8(%ebp),%eax
     8ac:	89 04 24             	mov    %eax,(%esp)
     8af:	e8 85 fc ff ff       	call   539 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8b4:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b7:	89 44 24 04          	mov    %eax,0x4(%esp)
     8bb:	8b 45 08             	mov    0x8(%ebp),%eax
     8be:	89 04 24             	mov    %eax,(%esp)
     8c1:	e8 93 ff ff ff       	call   859 <parsepipe>
     8c6:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8cd:	89 04 24             	mov    %eax,(%esp)
     8d0:	e8 7d fb ff ff       	call   452 <pipecmd>
     8d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8db:	c9                   	leave  
     8dc:	c3                   	ret    

000008dd <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8dd:	55                   	push   %ebp
     8de:	89 e5                	mov    %esp,%ebp
     8e0:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8e3:	e9 f6 00 00 00       	jmp    9de <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     8e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8ef:	00 
     8f0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8f7:	00 
     8f8:	8b 45 10             	mov    0x10(%ebp),%eax
     8fb:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ff:	8b 45 0c             	mov    0xc(%ebp),%eax
     902:	89 04 24             	mov    %eax,(%esp)
     905:	e8 2f fc ff ff       	call   539 <gettoken>
     90a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     90d:	8d 45 ec             	lea    -0x14(%ebp),%eax
     910:	89 44 24 0c          	mov    %eax,0xc(%esp)
     914:	8d 45 f0             	lea    -0x10(%ebp),%eax
     917:	89 44 24 08          	mov    %eax,0x8(%esp)
     91b:	8b 45 10             	mov    0x10(%ebp),%eax
     91e:	89 44 24 04          	mov    %eax,0x4(%esp)
     922:	8b 45 0c             	mov    0xc(%ebp),%eax
     925:	89 04 24             	mov    %eax,(%esp)
     928:	e8 0c fc ff ff       	call   539 <gettoken>
     92d:	83 f8 61             	cmp    $0x61,%eax
     930:	74 0c                	je     93e <parseredirs+0x61>
      panic("missing file for redirection");
     932:	c7 04 24 37 15 00 00 	movl   $0x1537,(%esp)
     939:	e8 19 fa ff ff       	call   357 <panic>
    switch(tok){
     93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     941:	83 f8 3c             	cmp    $0x3c,%eax
     944:	74 0f                	je     955 <parseredirs+0x78>
     946:	83 f8 3e             	cmp    $0x3e,%eax
     949:	74 38                	je     983 <parseredirs+0xa6>
     94b:	83 f8 2b             	cmp    $0x2b,%eax
     94e:	74 61                	je     9b1 <parseredirs+0xd4>
     950:	e9 89 00 00 00       	jmp    9de <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     955:	8b 55 ec             	mov    -0x14(%ebp),%edx
     958:	8b 45 f0             	mov    -0x10(%ebp),%eax
     95b:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     962:	00 
     963:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     96a:	00 
     96b:	89 54 24 08          	mov    %edx,0x8(%esp)
     96f:	89 44 24 04          	mov    %eax,0x4(%esp)
     973:	8b 45 08             	mov    0x8(%ebp),%eax
     976:	89 04 24             	mov    %eax,(%esp)
     979:	e8 69 fa ff ff       	call   3e7 <redircmd>
     97e:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     981:	eb 5b                	jmp    9de <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     983:	8b 55 ec             	mov    -0x14(%ebp),%edx
     986:	8b 45 f0             	mov    -0x10(%ebp),%eax
     989:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     990:	00 
     991:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     998:	00 
     999:	89 54 24 08          	mov    %edx,0x8(%esp)
     99d:	89 44 24 04          	mov    %eax,0x4(%esp)
     9a1:	8b 45 08             	mov    0x8(%ebp),%eax
     9a4:	89 04 24             	mov    %eax,(%esp)
     9a7:	e8 3b fa ff ff       	call   3e7 <redircmd>
     9ac:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9af:	eb 2d                	jmp    9de <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9b7:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9be:	00 
     9bf:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9c6:	00 
     9c7:	89 54 24 08          	mov    %edx,0x8(%esp)
     9cb:	89 44 24 04          	mov    %eax,0x4(%esp)
     9cf:	8b 45 08             	mov    0x8(%ebp),%eax
     9d2:	89 04 24             	mov    %eax,(%esp)
     9d5:	e8 0d fa ff ff       	call   3e7 <redircmd>
     9da:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9dd:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     9de:	c7 44 24 08 54 15 00 	movl   $0x1554,0x8(%esp)
     9e5:	00 
     9e6:	8b 45 10             	mov    0x10(%ebp),%eax
     9e9:	89 44 24 04          	mov    %eax,0x4(%esp)
     9ed:	8b 45 0c             	mov    0xc(%ebp),%eax
     9f0:	89 04 24             	mov    %eax,(%esp)
     9f3:	e8 8c fc ff ff       	call   684 <peek>
     9f8:	85 c0                	test   %eax,%eax
     9fa:	0f 85 e8 fe ff ff    	jne    8e8 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     a00:	8b 45 08             	mov    0x8(%ebp),%eax
}
     a03:	c9                   	leave  
     a04:	c3                   	ret    

00000a05 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     a05:	55                   	push   %ebp
     a06:	89 e5                	mov    %esp,%ebp
     a08:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a0b:	c7 44 24 08 57 15 00 	movl   $0x1557,0x8(%esp)
     a12:	00 
     a13:	8b 45 0c             	mov    0xc(%ebp),%eax
     a16:	89 44 24 04          	mov    %eax,0x4(%esp)
     a1a:	8b 45 08             	mov    0x8(%ebp),%eax
     a1d:	89 04 24             	mov    %eax,(%esp)
     a20:	e8 5f fc ff ff       	call   684 <peek>
     a25:	85 c0                	test   %eax,%eax
     a27:	75 0c                	jne    a35 <parseblock+0x30>
    panic("parseblock");
     a29:	c7 04 24 59 15 00 00 	movl   $0x1559,(%esp)
     a30:	e8 22 f9 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a35:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a3c:	00 
     a3d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a44:	00 
     a45:	8b 45 0c             	mov    0xc(%ebp),%eax
     a48:	89 44 24 04          	mov    %eax,0x4(%esp)
     a4c:	8b 45 08             	mov    0x8(%ebp),%eax
     a4f:	89 04 24             	mov    %eax,(%esp)
     a52:	e8 e2 fa ff ff       	call   539 <gettoken>
  cmd = parseline(ps, es);
     a57:	8b 45 0c             	mov    0xc(%ebp),%eax
     a5a:	89 44 24 04          	mov    %eax,0x4(%esp)
     a5e:	8b 45 08             	mov    0x8(%ebp),%eax
     a61:	89 04 24             	mov    %eax,(%esp)
     a64:	e8 1c fd ff ff       	call   785 <parseline>
     a69:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     a6c:	c7 44 24 08 64 15 00 	movl   $0x1564,0x8(%esp)
     a73:	00 
     a74:	8b 45 0c             	mov    0xc(%ebp),%eax
     a77:	89 44 24 04          	mov    %eax,0x4(%esp)
     a7b:	8b 45 08             	mov    0x8(%ebp),%eax
     a7e:	89 04 24             	mov    %eax,(%esp)
     a81:	e8 fe fb ff ff       	call   684 <peek>
     a86:	85 c0                	test   %eax,%eax
     a88:	75 0c                	jne    a96 <parseblock+0x91>
    panic("syntax - missing )");
     a8a:	c7 04 24 66 15 00 00 	movl   $0x1566,(%esp)
     a91:	e8 c1 f8 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a96:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a9d:	00 
     a9e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     aa5:	00 
     aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa9:	89 44 24 04          	mov    %eax,0x4(%esp)
     aad:	8b 45 08             	mov    0x8(%ebp),%eax
     ab0:	89 04 24             	mov    %eax,(%esp)
     ab3:	e8 81 fa ff ff       	call   539 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ab8:	8b 45 0c             	mov    0xc(%ebp),%eax
     abb:	89 44 24 08          	mov    %eax,0x8(%esp)
     abf:	8b 45 08             	mov    0x8(%ebp),%eax
     ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac9:	89 04 24             	mov    %eax,(%esp)
     acc:	e8 0c fe ff ff       	call   8dd <parseredirs>
     ad1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     ad4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ad7:	c9                   	leave  
     ad8:	c3                   	ret    

00000ad9 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     ad9:	55                   	push   %ebp
     ada:	89 e5                	mov    %esp,%ebp
     adc:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     adf:	c7 44 24 08 57 15 00 	movl   $0x1557,0x8(%esp)
     ae6:	00 
     ae7:	8b 45 0c             	mov    0xc(%ebp),%eax
     aea:	89 44 24 04          	mov    %eax,0x4(%esp)
     aee:	8b 45 08             	mov    0x8(%ebp),%eax
     af1:	89 04 24             	mov    %eax,(%esp)
     af4:	e8 8b fb ff ff       	call   684 <peek>
     af9:	85 c0                	test   %eax,%eax
     afb:	74 17                	je     b14 <parseexec+0x3b>
    return parseblock(ps, es);
     afd:	8b 45 0c             	mov    0xc(%ebp),%eax
     b00:	89 44 24 04          	mov    %eax,0x4(%esp)
     b04:	8b 45 08             	mov    0x8(%ebp),%eax
     b07:	89 04 24             	mov    %eax,(%esp)
     b0a:	e8 f6 fe ff ff       	call   a05 <parseblock>
     b0f:	e9 09 01 00 00       	jmp    c1d <parseexec+0x144>

  ret = execcmd();
     b14:	e8 90 f8 ff ff       	call   3a9 <execcmd>
     b19:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     b1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b1f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     b22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     b29:	8b 45 0c             	mov    0xc(%ebp),%eax
     b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
     b30:	8b 45 08             	mov    0x8(%ebp),%eax
     b33:	89 44 24 04          	mov    %eax,0x4(%esp)
     b37:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b3a:	89 04 24             	mov    %eax,(%esp)
     b3d:	e8 9b fd ff ff       	call   8dd <parseredirs>
     b42:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     b45:	e9 8f 00 00 00       	jmp    bd9 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b4a:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b4d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b51:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b54:	89 44 24 08          	mov    %eax,0x8(%esp)
     b58:	8b 45 0c             	mov    0xc(%ebp),%eax
     b5b:	89 44 24 04          	mov    %eax,0x4(%esp)
     b5f:	8b 45 08             	mov    0x8(%ebp),%eax
     b62:	89 04 24             	mov    %eax,(%esp)
     b65:	e8 cf f9 ff ff       	call   539 <gettoken>
     b6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b71:	75 05                	jne    b78 <parseexec+0x9f>
      break;
     b73:	e9 83 00 00 00       	jmp    bfb <parseexec+0x122>
    if(tok != 'a')
     b78:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     b7c:	74 0c                	je     b8a <parseexec+0xb1>
      panic("syntax");
     b7e:	c7 04 24 2a 15 00 00 	movl   $0x152a,(%esp)
     b85:	e8 cd f7 ff ff       	call   357 <panic>
    cmd->argv[argc] = q;
     b8a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     b8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b90:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b93:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     b97:	8b 55 e0             	mov    -0x20(%ebp),%edx
     b9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b9d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     ba0:	83 c1 08             	add    $0x8,%ecx
     ba3:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     ba7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     bab:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     baf:	7e 0c                	jle    bbd <parseexec+0xe4>
      panic("too many args");
     bb1:	c7 04 24 79 15 00 00 	movl   $0x1579,(%esp)
     bb8:	e8 9a f7 ff ff       	call   357 <panic>
    ret = parseredirs(ret, ps, es);
     bbd:	8b 45 0c             	mov    0xc(%ebp),%eax
     bc0:	89 44 24 08          	mov    %eax,0x8(%esp)
     bc4:	8b 45 08             	mov    0x8(%ebp),%eax
     bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
     bcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bce:	89 04 24             	mov    %eax,(%esp)
     bd1:	e8 07 fd ff ff       	call   8dd <parseredirs>
     bd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     bd9:	c7 44 24 08 87 15 00 	movl   $0x1587,0x8(%esp)
     be0:	00 
     be1:	8b 45 0c             	mov    0xc(%ebp),%eax
     be4:	89 44 24 04          	mov    %eax,0x4(%esp)
     be8:	8b 45 08             	mov    0x8(%ebp),%eax
     beb:	89 04 24             	mov    %eax,(%esp)
     bee:	e8 91 fa ff ff       	call   684 <peek>
     bf3:	85 c0                	test   %eax,%eax
     bf5:	0f 84 4f ff ff ff    	je     b4a <parseexec+0x71>
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     bfb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c01:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c08:	00 
  cmd->eargv[argc] = 0;
     c09:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c0f:	83 c2 08             	add    $0x8,%edx
     c12:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c19:	00 
  return ret;
     c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c1d:	c9                   	leave  
     c1e:	c3                   	ret    

00000c1f <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c1f:	55                   	push   %ebp
     c20:	89 e5                	mov    %esp,%ebp
     c22:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c25:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c29:	75 0a                	jne    c35 <nulterminate+0x16>
    return 0;
     c2b:	b8 00 00 00 00       	mov    $0x0,%eax
     c30:	e9 c9 00 00 00       	jmp    cfe <nulterminate+0xdf>
  
  switch(cmd->type){
     c35:	8b 45 08             	mov    0x8(%ebp),%eax
     c38:	8b 00                	mov    (%eax),%eax
     c3a:	83 f8 05             	cmp    $0x5,%eax
     c3d:	0f 87 b8 00 00 00    	ja     cfb <nulterminate+0xdc>
     c43:	8b 04 85 8c 15 00 00 	mov    0x158c(,%eax,4),%eax
     c4a:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c4c:	8b 45 08             	mov    0x8(%ebp),%eax
     c4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c59:	eb 14                	jmp    c6f <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c61:	83 c2 08             	add    $0x8,%edx
     c64:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     c68:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     c6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c72:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c75:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     c79:	85 c0                	test   %eax,%eax
     c7b:	75 de                	jne    c5b <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     c7d:	eb 7c                	jmp    cfb <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c7f:	8b 45 08             	mov    0x8(%ebp),%eax
     c82:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     c85:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c88:	8b 40 04             	mov    0x4(%eax),%eax
     c8b:	89 04 24             	mov    %eax,(%esp)
     c8e:	e8 8c ff ff ff       	call   c1f <nulterminate>
    *rcmd->efile = 0;
     c93:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c96:	8b 40 0c             	mov    0xc(%eax),%eax
     c99:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c9c:	eb 5d                	jmp    cfb <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c9e:	8b 45 08             	mov    0x8(%ebp),%eax
     ca1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     ca4:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ca7:	8b 40 04             	mov    0x4(%eax),%eax
     caa:	89 04 24             	mov    %eax,(%esp)
     cad:	e8 6d ff ff ff       	call   c1f <nulterminate>
    nulterminate(pcmd->right);
     cb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cb5:	8b 40 08             	mov    0x8(%eax),%eax
     cb8:	89 04 24             	mov    %eax,(%esp)
     cbb:	e8 5f ff ff ff       	call   c1f <nulterminate>
    break;
     cc0:	eb 39                	jmp    cfb <nulterminate+0xdc>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     cc2:	8b 45 08             	mov    0x8(%ebp),%eax
     cc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     cc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ccb:	8b 40 04             	mov    0x4(%eax),%eax
     cce:	89 04 24             	mov    %eax,(%esp)
     cd1:	e8 49 ff ff ff       	call   c1f <nulterminate>
    nulterminate(lcmd->right);
     cd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cd9:	8b 40 08             	mov    0x8(%eax),%eax
     cdc:	89 04 24             	mov    %eax,(%esp)
     cdf:	e8 3b ff ff ff       	call   c1f <nulterminate>
    break;
     ce4:	eb 15                	jmp    cfb <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     ce6:	8b 45 08             	mov    0x8(%ebp),%eax
     ce9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     cec:	8b 45 e0             	mov    -0x20(%ebp),%eax
     cef:	8b 40 04             	mov    0x4(%eax),%eax
     cf2:	89 04 24             	mov    %eax,(%esp)
     cf5:	e8 25 ff ff ff       	call   c1f <nulterminate>
    break;
     cfa:	90                   	nop
  }
  return cmd;
     cfb:	8b 45 08             	mov    0x8(%ebp),%eax
}
     cfe:	c9                   	leave  
     cff:	c3                   	ret    

00000d00 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	57                   	push   %edi
     d04:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     d05:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d08:	8b 55 10             	mov    0x10(%ebp),%edx
     d0b:	8b 45 0c             	mov    0xc(%ebp),%eax
     d0e:	89 cb                	mov    %ecx,%ebx
     d10:	89 df                	mov    %ebx,%edi
     d12:	89 d1                	mov    %edx,%ecx
     d14:	fc                   	cld    
     d15:	f3 aa                	rep stos %al,%es:(%edi)
     d17:	89 ca                	mov    %ecx,%edx
     d19:	89 fb                	mov    %edi,%ebx
     d1b:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d1e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d21:	5b                   	pop    %ebx
     d22:	5f                   	pop    %edi
     d23:	5d                   	pop    %ebp
     d24:	c3                   	ret    

00000d25 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     d25:	55                   	push   %ebp
     d26:	89 e5                	mov    %esp,%ebp
     d28:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d2b:	8b 45 08             	mov    0x8(%ebp),%eax
     d2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d31:	90                   	nop
     d32:	8b 45 08             	mov    0x8(%ebp),%eax
     d35:	8d 50 01             	lea    0x1(%eax),%edx
     d38:	89 55 08             	mov    %edx,0x8(%ebp)
     d3b:	8b 55 0c             	mov    0xc(%ebp),%edx
     d3e:	8d 4a 01             	lea    0x1(%edx),%ecx
     d41:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     d44:	0f b6 12             	movzbl (%edx),%edx
     d47:	88 10                	mov    %dl,(%eax)
     d49:	0f b6 00             	movzbl (%eax),%eax
     d4c:	84 c0                	test   %al,%al
     d4e:	75 e2                	jne    d32 <strcpy+0xd>
    ;
  return os;
     d50:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d53:	c9                   	leave  
     d54:	c3                   	ret    

00000d55 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d55:	55                   	push   %ebp
     d56:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d58:	eb 08                	jmp    d62 <strcmp+0xd>
    p++, q++;
     d5a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d5e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d62:	8b 45 08             	mov    0x8(%ebp),%eax
     d65:	0f b6 00             	movzbl (%eax),%eax
     d68:	84 c0                	test   %al,%al
     d6a:	74 10                	je     d7c <strcmp+0x27>
     d6c:	8b 45 08             	mov    0x8(%ebp),%eax
     d6f:	0f b6 10             	movzbl (%eax),%edx
     d72:	8b 45 0c             	mov    0xc(%ebp),%eax
     d75:	0f b6 00             	movzbl (%eax),%eax
     d78:	38 c2                	cmp    %al,%dl
     d7a:	74 de                	je     d5a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d7c:	8b 45 08             	mov    0x8(%ebp),%eax
     d7f:	0f b6 00             	movzbl (%eax),%eax
     d82:	0f b6 d0             	movzbl %al,%edx
     d85:	8b 45 0c             	mov    0xc(%ebp),%eax
     d88:	0f b6 00             	movzbl (%eax),%eax
     d8b:	0f b6 c0             	movzbl %al,%eax
     d8e:	29 c2                	sub    %eax,%edx
     d90:	89 d0                	mov    %edx,%eax
}
     d92:	5d                   	pop    %ebp
     d93:	c3                   	ret    

00000d94 <strlen>:

uint
strlen(char *s)
{
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
     d97:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     d9a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     da1:	eb 04                	jmp    da7 <strlen+0x13>
     da3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     da7:	8b 55 fc             	mov    -0x4(%ebp),%edx
     daa:	8b 45 08             	mov    0x8(%ebp),%eax
     dad:	01 d0                	add    %edx,%eax
     daf:	0f b6 00             	movzbl (%eax),%eax
     db2:	84 c0                	test   %al,%al
     db4:	75 ed                	jne    da3 <strlen+0xf>
    ;
  return n;
     db6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     db9:	c9                   	leave  
     dba:	c3                   	ret    

00000dbb <memset>:

void*
memset(void *dst, int c, uint n)
{
     dbb:	55                   	push   %ebp
     dbc:	89 e5                	mov    %esp,%ebp
     dbe:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     dc1:	8b 45 10             	mov    0x10(%ebp),%eax
     dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
     dc8:	8b 45 0c             	mov    0xc(%ebp),%eax
     dcb:	89 44 24 04          	mov    %eax,0x4(%esp)
     dcf:	8b 45 08             	mov    0x8(%ebp),%eax
     dd2:	89 04 24             	mov    %eax,(%esp)
     dd5:	e8 26 ff ff ff       	call   d00 <stosb>
  return dst;
     dda:	8b 45 08             	mov    0x8(%ebp),%eax
}
     ddd:	c9                   	leave  
     dde:	c3                   	ret    

00000ddf <strchr>:

char*
strchr(const char *s, char c)
{
     ddf:	55                   	push   %ebp
     de0:	89 e5                	mov    %esp,%ebp
     de2:	83 ec 04             	sub    $0x4,%esp
     de5:	8b 45 0c             	mov    0xc(%ebp),%eax
     de8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     deb:	eb 14                	jmp    e01 <strchr+0x22>
    if(*s == c)
     ded:	8b 45 08             	mov    0x8(%ebp),%eax
     df0:	0f b6 00             	movzbl (%eax),%eax
     df3:	3a 45 fc             	cmp    -0x4(%ebp),%al
     df6:	75 05                	jne    dfd <strchr+0x1e>
      return (char*)s;
     df8:	8b 45 08             	mov    0x8(%ebp),%eax
     dfb:	eb 13                	jmp    e10 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     dfd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e01:	8b 45 08             	mov    0x8(%ebp),%eax
     e04:	0f b6 00             	movzbl (%eax),%eax
     e07:	84 c0                	test   %al,%al
     e09:	75 e2                	jne    ded <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     e0b:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e10:	c9                   	leave  
     e11:	c3                   	ret    

00000e12 <gets>:

char*
gets(char *buf, int max)
{
     e12:	55                   	push   %ebp
     e13:	89 e5                	mov    %esp,%ebp
     e15:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e1f:	eb 4c                	jmp    e6d <gets+0x5b>
    cc = read(0, &c, 1);
     e21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e28:	00 
     e29:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e2c:	89 44 24 04          	mov    %eax,0x4(%esp)
     e30:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e37:	e8 44 01 00 00       	call   f80 <read>
     e3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     e3f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e43:	7f 02                	jg     e47 <gets+0x35>
      break;
     e45:	eb 31                	jmp    e78 <gets+0x66>
    buf[i++] = c;
     e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4a:	8d 50 01             	lea    0x1(%eax),%edx
     e4d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     e50:	89 c2                	mov    %eax,%edx
     e52:	8b 45 08             	mov    0x8(%ebp),%eax
     e55:	01 c2                	add    %eax,%edx
     e57:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e5b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     e5d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e61:	3c 0a                	cmp    $0xa,%al
     e63:	74 13                	je     e78 <gets+0x66>
     e65:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e69:	3c 0d                	cmp    $0xd,%al
     e6b:	74 0b                	je     e78 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e70:	83 c0 01             	add    $0x1,%eax
     e73:	3b 45 0c             	cmp    0xc(%ebp),%eax
     e76:	7c a9                	jl     e21 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e78:	8b 55 f4             	mov    -0xc(%ebp),%edx
     e7b:	8b 45 08             	mov    0x8(%ebp),%eax
     e7e:	01 d0                	add    %edx,%eax
     e80:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     e83:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e86:	c9                   	leave  
     e87:	c3                   	ret    

00000e88 <stat>:

int
stat(char *n, struct stat *st)
{
     e88:	55                   	push   %ebp
     e89:	89 e5                	mov    %esp,%ebp
     e8b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e8e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e95:	00 
     e96:	8b 45 08             	mov    0x8(%ebp),%eax
     e99:	89 04 24             	mov    %eax,(%esp)
     e9c:	e8 07 01 00 00       	call   fa8 <open>
     ea1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     ea4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea8:	79 07                	jns    eb1 <stat+0x29>
    return -1;
     eaa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     eaf:	eb 23                	jmp    ed4 <stat+0x4c>
  r = fstat(fd, st);
     eb1:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
     eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ebb:	89 04 24             	mov    %eax,(%esp)
     ebe:	e8 fd 00 00 00       	call   fc0 <fstat>
     ec3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec9:	89 04 24             	mov    %eax,(%esp)
     ecc:	e8 bf 00 00 00       	call   f90 <close>
  return r;
     ed1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     ed4:	c9                   	leave  
     ed5:	c3                   	ret    

00000ed6 <atoi>:

int
atoi(const char *s)
{
     ed6:	55                   	push   %ebp
     ed7:	89 e5                	mov    %esp,%ebp
     ed9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     edc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     ee3:	eb 25                	jmp    f0a <atoi+0x34>
    n = n*10 + *s++ - '0';
     ee5:	8b 55 fc             	mov    -0x4(%ebp),%edx
     ee8:	89 d0                	mov    %edx,%eax
     eea:	c1 e0 02             	shl    $0x2,%eax
     eed:	01 d0                	add    %edx,%eax
     eef:	01 c0                	add    %eax,%eax
     ef1:	89 c1                	mov    %eax,%ecx
     ef3:	8b 45 08             	mov    0x8(%ebp),%eax
     ef6:	8d 50 01             	lea    0x1(%eax),%edx
     ef9:	89 55 08             	mov    %edx,0x8(%ebp)
     efc:	0f b6 00             	movzbl (%eax),%eax
     eff:	0f be c0             	movsbl %al,%eax
     f02:	01 c8                	add    %ecx,%eax
     f04:	83 e8 30             	sub    $0x30,%eax
     f07:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f0a:	8b 45 08             	mov    0x8(%ebp),%eax
     f0d:	0f b6 00             	movzbl (%eax),%eax
     f10:	3c 2f                	cmp    $0x2f,%al
     f12:	7e 0a                	jle    f1e <atoi+0x48>
     f14:	8b 45 08             	mov    0x8(%ebp),%eax
     f17:	0f b6 00             	movzbl (%eax),%eax
     f1a:	3c 39                	cmp    $0x39,%al
     f1c:	7e c7                	jle    ee5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     f1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f21:	c9                   	leave  
     f22:	c3                   	ret    

00000f23 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     f23:	55                   	push   %ebp
     f24:	89 e5                	mov    %esp,%ebp
     f26:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     f29:	8b 45 08             	mov    0x8(%ebp),%eax
     f2c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
     f32:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     f35:	eb 17                	jmp    f4e <memmove+0x2b>
    *dst++ = *src++;
     f37:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f3a:	8d 50 01             	lea    0x1(%eax),%edx
     f3d:	89 55 fc             	mov    %edx,-0x4(%ebp)
     f40:	8b 55 f8             	mov    -0x8(%ebp),%edx
     f43:	8d 4a 01             	lea    0x1(%edx),%ecx
     f46:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     f49:	0f b6 12             	movzbl (%edx),%edx
     f4c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f4e:	8b 45 10             	mov    0x10(%ebp),%eax
     f51:	8d 50 ff             	lea    -0x1(%eax),%edx
     f54:	89 55 10             	mov    %edx,0x10(%ebp)
     f57:	85 c0                	test   %eax,%eax
     f59:	7f dc                	jg     f37 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     f5b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f5e:	c9                   	leave  
     f5f:	c3                   	ret    

00000f60 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f60:	b8 01 00 00 00       	mov    $0x1,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	ret    

00000f68 <exit>:
SYSCALL(exit)
     f68:	b8 02 00 00 00       	mov    $0x2,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	ret    

00000f70 <wait>:
SYSCALL(wait)
     f70:	b8 03 00 00 00       	mov    $0x3,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	ret    

00000f78 <pipe>:
SYSCALL(pipe)
     f78:	b8 04 00 00 00       	mov    $0x4,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	ret    

00000f80 <read>:
SYSCALL(read)
     f80:	b8 05 00 00 00       	mov    $0x5,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	ret    

00000f88 <write>:
SYSCALL(write)
     f88:	b8 10 00 00 00       	mov    $0x10,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	ret    

00000f90 <close>:
SYSCALL(close)
     f90:	b8 15 00 00 00       	mov    $0x15,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	ret    

00000f98 <kill>:
SYSCALL(kill)
     f98:	b8 06 00 00 00       	mov    $0x6,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <exec>:
SYSCALL(exec)
     fa0:	b8 07 00 00 00       	mov    $0x7,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <open>:
SYSCALL(open)
     fa8:	b8 0f 00 00 00       	mov    $0xf,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <mknod>:
SYSCALL(mknod)
     fb0:	b8 11 00 00 00       	mov    $0x11,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <unlink>:
SYSCALL(unlink)
     fb8:	b8 12 00 00 00       	mov    $0x12,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <fstat>:
SYSCALL(fstat)
     fc0:	b8 08 00 00 00       	mov    $0x8,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <link>:
SYSCALL(link)
     fc8:	b8 13 00 00 00       	mov    $0x13,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <mkdir>:
SYSCALL(mkdir)
     fd0:	b8 14 00 00 00       	mov    $0x14,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <chdir>:
SYSCALL(chdir)
     fd8:	b8 09 00 00 00       	mov    $0x9,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <dup>:
SYSCALL(dup)
     fe0:	b8 0a 00 00 00       	mov    $0xa,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <getpid>:
SYSCALL(getpid)
     fe8:	b8 0b 00 00 00       	mov    $0xb,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <sbrk>:
SYSCALL(sbrk)
     ff0:	b8 0c 00 00 00       	mov    $0xc,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <sleep>:
SYSCALL(sleep)
     ff8:	b8 0d 00 00 00       	mov    $0xd,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <uptime>:
SYSCALL(uptime)
    1000:	b8 0e 00 00 00       	mov    $0xe,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1008:	55                   	push   %ebp
    1009:	89 e5                	mov    %esp,%ebp
    100b:	83 ec 18             	sub    $0x18,%esp
    100e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1011:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1014:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    101b:	00 
    101c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    101f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1023:	8b 45 08             	mov    0x8(%ebp),%eax
    1026:	89 04 24             	mov    %eax,(%esp)
    1029:	e8 5a ff ff ff       	call   f88 <write>
}
    102e:	c9                   	leave  
    102f:	c3                   	ret    

00001030 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	56                   	push   %esi
    1034:	53                   	push   %ebx
    1035:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1038:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    103f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1043:	74 17                	je     105c <printint+0x2c>
    1045:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1049:	79 11                	jns    105c <printint+0x2c>
    neg = 1;
    104b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1052:	8b 45 0c             	mov    0xc(%ebp),%eax
    1055:	f7 d8                	neg    %eax
    1057:	89 45 ec             	mov    %eax,-0x14(%ebp)
    105a:	eb 06                	jmp    1062 <printint+0x32>
  } else {
    x = xx;
    105c:	8b 45 0c             	mov    0xc(%ebp),%eax
    105f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    1062:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    1069:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    106c:	8d 41 01             	lea    0x1(%ecx),%eax
    106f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1072:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1075:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1078:	ba 00 00 00 00       	mov    $0x0,%edx
    107d:	f7 f3                	div    %ebx
    107f:	89 d0                	mov    %edx,%eax
    1081:	0f b6 80 3a 1a 00 00 	movzbl 0x1a3a(%eax),%eax
    1088:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    108c:	8b 75 10             	mov    0x10(%ebp),%esi
    108f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1092:	ba 00 00 00 00       	mov    $0x0,%edx
    1097:	f7 f6                	div    %esi
    1099:	89 45 ec             	mov    %eax,-0x14(%ebp)
    109c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10a0:	75 c7                	jne    1069 <printint+0x39>
  if(neg)
    10a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10a6:	74 10                	je     10b8 <printint+0x88>
    buf[i++] = '-';
    10a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ab:	8d 50 01             	lea    0x1(%eax),%edx
    10ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
    10b1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    10b6:	eb 1f                	jmp    10d7 <printint+0xa7>
    10b8:	eb 1d                	jmp    10d7 <printint+0xa7>
    putc(fd, buf[i]);
    10ba:	8d 55 dc             	lea    -0x24(%ebp),%edx
    10bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c0:	01 d0                	add    %edx,%eax
    10c2:	0f b6 00             	movzbl (%eax),%eax
    10c5:	0f be c0             	movsbl %al,%eax
    10c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    10cc:	8b 45 08             	mov    0x8(%ebp),%eax
    10cf:	89 04 24             	mov    %eax,(%esp)
    10d2:	e8 31 ff ff ff       	call   1008 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    10d7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    10db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10df:	79 d9                	jns    10ba <printint+0x8a>
    putc(fd, buf[i]);
}
    10e1:	83 c4 30             	add    $0x30,%esp
    10e4:	5b                   	pop    %ebx
    10e5:	5e                   	pop    %esi
    10e6:	5d                   	pop    %ebp
    10e7:	c3                   	ret    

000010e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    10ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    10f5:	8d 45 0c             	lea    0xc(%ebp),%eax
    10f8:	83 c0 04             	add    $0x4,%eax
    10fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    10fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1105:	e9 7c 01 00 00       	jmp    1286 <printf+0x19e>
    c = fmt[i] & 0xff;
    110a:	8b 55 0c             	mov    0xc(%ebp),%edx
    110d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1110:	01 d0                	add    %edx,%eax
    1112:	0f b6 00             	movzbl (%eax),%eax
    1115:	0f be c0             	movsbl %al,%eax
    1118:	25 ff 00 00 00       	and    $0xff,%eax
    111d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1120:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1124:	75 2c                	jne    1152 <printf+0x6a>
      if(c == '%'){
    1126:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    112a:	75 0c                	jne    1138 <printf+0x50>
        state = '%';
    112c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1133:	e9 4a 01 00 00       	jmp    1282 <printf+0x19a>
      } else {
        putc(fd, c);
    1138:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    113b:	0f be c0             	movsbl %al,%eax
    113e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
    1145:	89 04 24             	mov    %eax,(%esp)
    1148:	e8 bb fe ff ff       	call   1008 <putc>
    114d:	e9 30 01 00 00       	jmp    1282 <printf+0x19a>
      }
    } else if(state == '%'){
    1152:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    1156:	0f 85 26 01 00 00    	jne    1282 <printf+0x19a>
      if(c == 'd'){
    115c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    1160:	75 2d                	jne    118f <printf+0xa7>
        printint(fd, *ap, 10, 1);
    1162:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1165:	8b 00                	mov    (%eax),%eax
    1167:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    116e:	00 
    116f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1176:	00 
    1177:	89 44 24 04          	mov    %eax,0x4(%esp)
    117b:	8b 45 08             	mov    0x8(%ebp),%eax
    117e:	89 04 24             	mov    %eax,(%esp)
    1181:	e8 aa fe ff ff       	call   1030 <printint>
        ap++;
    1186:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    118a:	e9 ec 00 00 00       	jmp    127b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    118f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1193:	74 06                	je     119b <printf+0xb3>
    1195:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    1199:	75 2d                	jne    11c8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    119b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    119e:	8b 00                	mov    (%eax),%eax
    11a0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    11a7:	00 
    11a8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    11af:	00 
    11b0:	89 44 24 04          	mov    %eax,0x4(%esp)
    11b4:	8b 45 08             	mov    0x8(%ebp),%eax
    11b7:	89 04 24             	mov    %eax,(%esp)
    11ba:	e8 71 fe ff ff       	call   1030 <printint>
        ap++;
    11bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    11c3:	e9 b3 00 00 00       	jmp    127b <printf+0x193>
      } else if(c == 's'){
    11c8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    11cc:	75 45                	jne    1213 <printf+0x12b>
        s = (char*)*ap;
    11ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11d1:	8b 00                	mov    (%eax),%eax
    11d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    11d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    11da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11de:	75 09                	jne    11e9 <printf+0x101>
          s = "(null)";
    11e0:	c7 45 f4 a4 15 00 00 	movl   $0x15a4,-0xc(%ebp)
        while(*s != 0){
    11e7:	eb 1e                	jmp    1207 <printf+0x11f>
    11e9:	eb 1c                	jmp    1207 <printf+0x11f>
          putc(fd, *s);
    11eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ee:	0f b6 00             	movzbl (%eax),%eax
    11f1:	0f be c0             	movsbl %al,%eax
    11f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    11f8:	8b 45 08             	mov    0x8(%ebp),%eax
    11fb:	89 04 24             	mov    %eax,(%esp)
    11fe:	e8 05 fe ff ff       	call   1008 <putc>
          s++;
    1203:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120a:	0f b6 00             	movzbl (%eax),%eax
    120d:	84 c0                	test   %al,%al
    120f:	75 da                	jne    11eb <printf+0x103>
    1211:	eb 68                	jmp    127b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1213:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1217:	75 1d                	jne    1236 <printf+0x14e>
        putc(fd, *ap);
    1219:	8b 45 e8             	mov    -0x18(%ebp),%eax
    121c:	8b 00                	mov    (%eax),%eax
    121e:	0f be c0             	movsbl %al,%eax
    1221:	89 44 24 04          	mov    %eax,0x4(%esp)
    1225:	8b 45 08             	mov    0x8(%ebp),%eax
    1228:	89 04 24             	mov    %eax,(%esp)
    122b:	e8 d8 fd ff ff       	call   1008 <putc>
        ap++;
    1230:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1234:	eb 45                	jmp    127b <printf+0x193>
      } else if(c == '%'){
    1236:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    123a:	75 17                	jne    1253 <printf+0x16b>
        putc(fd, c);
    123c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    123f:	0f be c0             	movsbl %al,%eax
    1242:	89 44 24 04          	mov    %eax,0x4(%esp)
    1246:	8b 45 08             	mov    0x8(%ebp),%eax
    1249:	89 04 24             	mov    %eax,(%esp)
    124c:	e8 b7 fd ff ff       	call   1008 <putc>
    1251:	eb 28                	jmp    127b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1253:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    125a:	00 
    125b:	8b 45 08             	mov    0x8(%ebp),%eax
    125e:	89 04 24             	mov    %eax,(%esp)
    1261:	e8 a2 fd ff ff       	call   1008 <putc>
        putc(fd, c);
    1266:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1269:	0f be c0             	movsbl %al,%eax
    126c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1270:	8b 45 08             	mov    0x8(%ebp),%eax
    1273:	89 04 24             	mov    %eax,(%esp)
    1276:	e8 8d fd ff ff       	call   1008 <putc>
      }
      state = 0;
    127b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1282:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1286:	8b 55 0c             	mov    0xc(%ebp),%edx
    1289:	8b 45 f0             	mov    -0x10(%ebp),%eax
    128c:	01 d0                	add    %edx,%eax
    128e:	0f b6 00             	movzbl (%eax),%eax
    1291:	84 c0                	test   %al,%al
    1293:	0f 85 71 fe ff ff    	jne    110a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1299:	c9                   	leave  
    129a:	c3                   	ret    

0000129b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    129b:	55                   	push   %ebp
    129c:	89 e5                	mov    %esp,%ebp
    129e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    12a1:	8b 45 08             	mov    0x8(%ebp),%eax
    12a4:	83 e8 08             	sub    $0x8,%eax
    12a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12aa:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    12af:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12b2:	eb 24                	jmp    12d8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12b7:	8b 00                	mov    (%eax),%eax
    12b9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12bc:	77 12                	ja     12d0 <free+0x35>
    12be:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12c1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12c4:	77 24                	ja     12ea <free+0x4f>
    12c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12c9:	8b 00                	mov    (%eax),%eax
    12cb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    12ce:	77 1a                	ja     12ea <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12d3:	8b 00                	mov    (%eax),%eax
    12d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12de:	76 d4                	jbe    12b4 <free+0x19>
    12e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12e3:	8b 00                	mov    (%eax),%eax
    12e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    12e8:	76 ca                	jbe    12b4 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    12ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12ed:	8b 40 04             	mov    0x4(%eax),%eax
    12f0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    12f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12fa:	01 c2                	add    %eax,%edx
    12fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12ff:	8b 00                	mov    (%eax),%eax
    1301:	39 c2                	cmp    %eax,%edx
    1303:	75 24                	jne    1329 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1305:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1308:	8b 50 04             	mov    0x4(%eax),%edx
    130b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    130e:	8b 00                	mov    (%eax),%eax
    1310:	8b 40 04             	mov    0x4(%eax),%eax
    1313:	01 c2                	add    %eax,%edx
    1315:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1318:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    131b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    131e:	8b 00                	mov    (%eax),%eax
    1320:	8b 10                	mov    (%eax),%edx
    1322:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1325:	89 10                	mov    %edx,(%eax)
    1327:	eb 0a                	jmp    1333 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1329:	8b 45 fc             	mov    -0x4(%ebp),%eax
    132c:	8b 10                	mov    (%eax),%edx
    132e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1331:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1333:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1336:	8b 40 04             	mov    0x4(%eax),%eax
    1339:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1340:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1343:	01 d0                	add    %edx,%eax
    1345:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1348:	75 20                	jne    136a <free+0xcf>
    p->s.size += bp->s.size;
    134a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    134d:	8b 50 04             	mov    0x4(%eax),%edx
    1350:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1353:	8b 40 04             	mov    0x4(%eax),%eax
    1356:	01 c2                	add    %eax,%edx
    1358:	8b 45 fc             	mov    -0x4(%ebp),%eax
    135b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    135e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1361:	8b 10                	mov    (%eax),%edx
    1363:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1366:	89 10                	mov    %edx,(%eax)
    1368:	eb 08                	jmp    1372 <free+0xd7>
  } else
    p->s.ptr = bp;
    136a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    136d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1370:	89 10                	mov    %edx,(%eax)
  freep = p;
    1372:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1375:	a3 cc 1a 00 00       	mov    %eax,0x1acc
}
    137a:	c9                   	leave  
    137b:	c3                   	ret    

0000137c <morecore>:

static Header*
morecore(uint nu)
{
    137c:	55                   	push   %ebp
    137d:	89 e5                	mov    %esp,%ebp
    137f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1382:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1389:	77 07                	ja     1392 <morecore+0x16>
    nu = 4096;
    138b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1392:	8b 45 08             	mov    0x8(%ebp),%eax
    1395:	c1 e0 03             	shl    $0x3,%eax
    1398:	89 04 24             	mov    %eax,(%esp)
    139b:	e8 50 fc ff ff       	call   ff0 <sbrk>
    13a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    13a3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    13a7:	75 07                	jne    13b0 <morecore+0x34>
    return 0;
    13a9:	b8 00 00 00 00       	mov    $0x0,%eax
    13ae:	eb 22                	jmp    13d2 <morecore+0x56>
  hp = (Header*)p;
    13b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    13b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13b9:	8b 55 08             	mov    0x8(%ebp),%edx
    13bc:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    13bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13c2:	83 c0 08             	add    $0x8,%eax
    13c5:	89 04 24             	mov    %eax,(%esp)
    13c8:	e8 ce fe ff ff       	call   129b <free>
  return freep;
    13cd:	a1 cc 1a 00 00       	mov    0x1acc,%eax
}
    13d2:	c9                   	leave  
    13d3:	c3                   	ret    

000013d4 <malloc>:

void*
malloc(uint nbytes)
{
    13d4:	55                   	push   %ebp
    13d5:	89 e5                	mov    %esp,%ebp
    13d7:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13da:	8b 45 08             	mov    0x8(%ebp),%eax
    13dd:	83 c0 07             	add    $0x7,%eax
    13e0:	c1 e8 03             	shr    $0x3,%eax
    13e3:	83 c0 01             	add    $0x1,%eax
    13e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    13e9:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    13ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    13f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    13f5:	75 23                	jne    141a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    13f7:	c7 45 f0 c4 1a 00 00 	movl   $0x1ac4,-0x10(%ebp)
    13fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1401:	a3 cc 1a 00 00       	mov    %eax,0x1acc
    1406:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    140b:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
    base.s.size = 0;
    1410:	c7 05 c8 1a 00 00 00 	movl   $0x0,0x1ac8
    1417:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    141a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    141d:	8b 00                	mov    (%eax),%eax
    141f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1422:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1425:	8b 40 04             	mov    0x4(%eax),%eax
    1428:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    142b:	72 4d                	jb     147a <malloc+0xa6>
      if(p->s.size == nunits)
    142d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1430:	8b 40 04             	mov    0x4(%eax),%eax
    1433:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1436:	75 0c                	jne    1444 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1438:	8b 45 f4             	mov    -0xc(%ebp),%eax
    143b:	8b 10                	mov    (%eax),%edx
    143d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1440:	89 10                	mov    %edx,(%eax)
    1442:	eb 26                	jmp    146a <malloc+0x96>
      else {
        p->s.size -= nunits;
    1444:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1447:	8b 40 04             	mov    0x4(%eax),%eax
    144a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    144d:	89 c2                	mov    %eax,%edx
    144f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1452:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1455:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1458:	8b 40 04             	mov    0x4(%eax),%eax
    145b:	c1 e0 03             	shl    $0x3,%eax
    145e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1461:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1464:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1467:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    146a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    146d:	a3 cc 1a 00 00       	mov    %eax,0x1acc
      return (void*)(p + 1);
    1472:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1475:	83 c0 08             	add    $0x8,%eax
    1478:	eb 38                	jmp    14b2 <malloc+0xde>
    }
    if(p == freep)
    147a:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    147f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1482:	75 1b                	jne    149f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1484:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1487:	89 04 24             	mov    %eax,(%esp)
    148a:	e8 ed fe ff ff       	call   137c <morecore>
    148f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1492:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1496:	75 07                	jne    149f <malloc+0xcb>
        return 0;
    1498:	b8 00 00 00 00       	mov    $0x0,%eax
    149d:	eb 13                	jmp    14b2 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    149f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    14a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a8:	8b 00                	mov    (%eax),%eax
    14aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    14ad:	e9 70 ff ff ff       	jmp    1422 <malloc+0x4e>
}
    14b2:	c9                   	leave  
    14b3:	c3                   	ret    
