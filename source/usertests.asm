
_usertests: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 1b 4d 00 00       	push   $0x4d1b
      16:	6a 01                	push   $0x1
      18:	e8 13 3a 00 00       	call   3a30 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 2f 4d 00 00       	push   $0x4d2f
      26:	e8 f7 38 00 00       	call   3922 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 98 54 00 00       	push   $0x5498
      3a:	6a 01                	push   $0x1
      3c:	e8 ef 39 00 00       	call   3a30 <printf>
    exit();
      41:	e8 9c 38 00 00       	call   38e2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 2f 4d 00 00       	push   $0x4d2f
      52:	e8 cb 38 00 00       	call   3922 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 ab 38 00 00       	call   390a <close>

  createdelete();
      5f:	e8 bc 11 00 00       	call   1220 <createdelete>
  linkunlink();
      64:	e8 a7 1a 00 00       	call   1b10 <linkunlink>
  concreate();
      69:	e8 72 17 00 00       	call   17e0 <concreate>
  fourfiles();
      6e:	e8 ad 0f 00 00       	call   1020 <fourfiles>
  sharedfd();
      73:	e8 e8 0d 00 00       	call   e60 <sharedfd>

  bigargtest();
      78:	e8 83 32 00 00       	call   3300 <bigargtest>
  bigwrite();
      7d:	e8 ae 23 00 00       	call   2430 <bigwrite>
  bigargtest();
      82:	e8 79 32 00 00       	call   3300 <bigargtest>
  bsstest();
      87:	e8 04 32 00 00       	call   3290 <bsstest>
  sbrktest();
      8c:	e8 ef 2c 00 00       	call   2d80 <sbrktest>
  validatetest();
      91:	e8 3a 31 00 00       	call   31d0 <validatetest>

  opentest();
      96:	e8 55 03 00 00       	call   3f0 <opentest>
  writetest();
      9b:	e8 e0 03 00 00       	call   480 <writetest>
  writetest1();
      a0:	e8 bb 05 00 00       	call   660 <writetest1>
  createtest();
      a5:	e8 86 07 00 00       	call   830 <createtest>

  openiputtest();
      aa:	e8 31 02 00 00       	call   2e0 <openiputtest>
  exitiputtest();
      af:	e8 3c 01 00 00       	call   1f0 <exitiputtest>
  iputtest();
      b4:	e8 57 00 00 00       	call   110 <iputtest>

  mem();
      b9:	e8 d2 0c 00 00       	call   d90 <mem>
  pipe1();
      be:	e8 4d 09 00 00       	call   a10 <pipe1>
  preempt();
      c3:	e8 e8 0a 00 00       	call   bb0 <preempt>
  exitwait();
      c8:	e8 33 0c 00 00       	call   d00 <exitwait>

  rmdot();
      cd:	e8 4e 27 00 00       	call   2820 <rmdot>
  fourteen();
      d2:	e8 09 26 00 00       	call   26e0 <fourteen>
  bigfile();
      d7:	e8 34 24 00 00       	call   2510 <bigfile>
  subdir();
      dc:	e8 6f 1c 00 00       	call   1d50 <subdir>
  linktest();
      e1:	e8 ea 14 00 00       	call   15d0 <linktest>
  unlinkread();
      e6:	e8 55 13 00 00       	call   1440 <unlinkread>
  dirfile();
      eb:	e8 b0 28 00 00       	call   29a0 <dirfile>
  iref();
      f0:	e8 ab 2a 00 00       	call   2ba0 <iref>
  forktest();
      f5:	e8 c6 2b 00 00       	call   2cc0 <forktest>
  bigdir(); // slow
      fa:	e8 21 1b 00 00       	call   1c20 <bigdir>

  uio();
      ff:	e8 fc 34 00 00       	call   3600 <uio>

  exectest();
     104:	e8 b7 08 00 00       	call   9c0 <exectest>

  exit();
     109:	e8 d4 37 00 00       	call   38e2 <exit>
     10e:	66 90                	xchg   %ax,%ax

00000110 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     116:	68 e4 3d 00 00       	push   $0x3de4
     11b:	ff 35 98 5d 00 00    	pushl  0x5d98
     121:	e8 0a 39 00 00       	call   3a30 <printf>

  if(mkdir("iputdir") < 0){
     126:	c7 04 24 77 3d 00 00 	movl   $0x3d77,(%esp)
     12d:	e8 18 38 00 00       	call   394a <mkdir>
     132:	83 c4 10             	add    $0x10,%esp
     135:	85 c0                	test   %eax,%eax
     137:	78 58                	js     191 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     139:	83 ec 0c             	sub    $0xc,%esp
     13c:	68 77 3d 00 00       	push   $0x3d77
     141:	e8 0c 38 00 00       	call   3952 <chdir>
     146:	83 c4 10             	add    $0x10,%esp
     149:	85 c0                	test   %eax,%eax
     14b:	0f 88 85 00 00 00    	js     1d6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     151:	83 ec 0c             	sub    $0xc,%esp
     154:	68 74 3d 00 00       	push   $0x3d74
     159:	e8 d4 37 00 00       	call   3932 <unlink>
     15e:	83 c4 10             	add    $0x10,%esp
     161:	85 c0                	test   %eax,%eax
     163:	78 5a                	js     1bf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     165:	83 ec 0c             	sub    $0xc,%esp
     168:	68 99 3d 00 00       	push   $0x3d99
     16d:	e8 e0 37 00 00       	call   3952 <chdir>
     172:	83 c4 10             	add    $0x10,%esp
     175:	85 c0                	test   %eax,%eax
     177:	78 2f                	js     1a8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     179:	83 ec 08             	sub    $0x8,%esp
     17c:	68 1c 3e 00 00       	push   $0x3e1c
     181:	ff 35 98 5d 00 00    	pushl  0x5d98
     187:	e8 a4 38 00 00       	call   3a30 <printf>
}
     18c:	83 c4 10             	add    $0x10,%esp
     18f:	c9                   	leave  
     190:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     191:	50                   	push   %eax
     192:	50                   	push   %eax
     193:	68 50 3d 00 00       	push   $0x3d50
     198:	ff 35 98 5d 00 00    	pushl  0x5d98
     19e:	e8 8d 38 00 00       	call   3a30 <printf>
    exit();
     1a3:	e8 3a 37 00 00       	call   38e2 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1a8:	50                   	push   %eax
     1a9:	50                   	push   %eax
     1aa:	68 9b 3d 00 00       	push   $0x3d9b
     1af:	ff 35 98 5d 00 00    	pushl  0x5d98
     1b5:	e8 76 38 00 00       	call   3a30 <printf>
    exit();
     1ba:	e8 23 37 00 00       	call   38e2 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1bf:	52                   	push   %edx
     1c0:	52                   	push   %edx
     1c1:	68 7f 3d 00 00       	push   $0x3d7f
     1c6:	ff 35 98 5d 00 00    	pushl  0x5d98
     1cc:	e8 5f 38 00 00       	call   3a30 <printf>
    exit();
     1d1:	e8 0c 37 00 00       	call   38e2 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1d6:	51                   	push   %ecx
     1d7:	51                   	push   %ecx
     1d8:	68 5e 3d 00 00       	push   $0x3d5e
     1dd:	ff 35 98 5d 00 00    	pushl  0x5d98
     1e3:	e8 48 38 00 00       	call   3a30 <printf>
    exit();
     1e8:	e8 f5 36 00 00       	call   38e2 <exit>
     1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     1f6:	68 ab 3d 00 00       	push   $0x3dab
     1fb:	ff 35 98 5d 00 00    	pushl  0x5d98
     201:	e8 2a 38 00 00       	call   3a30 <printf>

  pid = fork(0);
     206:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     20d:	e8 c8 36 00 00       	call   38da <fork>
  if(pid < 0){
     212:	83 c4 10             	add    $0x10,%esp
     215:	85 c0                	test   %eax,%eax
     217:	78 7f                	js     298 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     219:	75 45                	jne    260 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     21b:	83 ec 0c             	sub    $0xc,%esp
     21e:	68 77 3d 00 00       	push   $0x3d77
     223:	e8 22 37 00 00       	call   394a <mkdir>
     228:	83 c4 10             	add    $0x10,%esp
     22b:	85 c0                	test   %eax,%eax
     22d:	0f 88 93 00 00 00    	js     2c6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     233:	83 ec 0c             	sub    $0xc,%esp
     236:	68 77 3d 00 00       	push   $0x3d77
     23b:	e8 12 37 00 00       	call   3952 <chdir>
     240:	83 c4 10             	add    $0x10,%esp
     243:	85 c0                	test   %eax,%eax
     245:	78 68                	js     2af <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     247:	83 ec 0c             	sub    $0xc,%esp
     24a:	68 74 3d 00 00       	push   $0x3d74
     24f:	e8 de 36 00 00       	call   3932 <unlink>
     254:	83 c4 10             	add    $0x10,%esp
     257:	85 c0                	test   %eax,%eax
     259:	78 25                	js     280 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     25b:	e8 82 36 00 00       	call   38e2 <exit>
  }
  wait();
     260:	e8 85 36 00 00       	call   38ea <wait>
  printf(stdout, "exitiput test ok\n");
     265:	83 ec 08             	sub    $0x8,%esp
     268:	68 ce 3d 00 00       	push   $0x3dce
     26d:	ff 35 98 5d 00 00    	pushl  0x5d98
     273:	e8 b8 37 00 00       	call   3a30 <printf>
}
     278:	83 c4 10             	add    $0x10,%esp
     27b:	c9                   	leave  
     27c:	c3                   	ret    
     27d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     280:	83 ec 08             	sub    $0x8,%esp
     283:	68 7f 3d 00 00       	push   $0x3d7f
     288:	ff 35 98 5d 00 00    	pushl  0x5d98
     28e:	e8 9d 37 00 00       	call   3a30 <printf>
      exit();
     293:	e8 4a 36 00 00       	call   38e2 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork(0);
  if(pid < 0){
    printf(stdout, "fork failed\n");
     298:	51                   	push   %ecx
     299:	51                   	push   %ecx
     29a:	68 91 4c 00 00       	push   $0x4c91
     29f:	ff 35 98 5d 00 00    	pushl  0x5d98
     2a5:	e8 86 37 00 00       	call   3a30 <printf>
    exit();
     2aa:	e8 33 36 00 00       	call   38e2 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2af:	50                   	push   %eax
     2b0:	50                   	push   %eax
     2b1:	68 ba 3d 00 00       	push   $0x3dba
     2b6:	ff 35 98 5d 00 00    	pushl  0x5d98
     2bc:	e8 6f 37 00 00       	call   3a30 <printf>
      exit();
     2c1:	e8 1c 36 00 00       	call   38e2 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2c6:	52                   	push   %edx
     2c7:	52                   	push   %edx
     2c8:	68 50 3d 00 00       	push   $0x3d50
     2cd:	ff 35 98 5d 00 00    	pushl  0x5d98
     2d3:	e8 58 37 00 00       	call   3a30 <printf>
      exit();
     2d8:	e8 05 36 00 00       	call   38e2 <exit>
     2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2e6:	68 e0 3d 00 00       	push   $0x3de0
     2eb:	ff 35 98 5d 00 00    	pushl  0x5d98
     2f1:	e8 3a 37 00 00       	call   3a30 <printf>
  if(mkdir("oidir") < 0){
     2f6:	c7 04 24 ef 3d 00 00 	movl   $0x3def,(%esp)
     2fd:	e8 48 36 00 00       	call   394a <mkdir>
     302:	83 c4 10             	add    $0x10,%esp
     305:	85 c0                	test   %eax,%eax
     307:	0f 88 90 00 00 00    	js     39d <openiputtest+0xbd>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork(0);
     30d:	83 ec 0c             	sub    $0xc,%esp
     310:	6a 00                	push   $0x0
     312:	e8 c3 35 00 00       	call   38da <fork>
  if(pid < 0){
     317:	83 c4 10             	add    $0x10,%esp
     31a:	85 c0                	test   %eax,%eax
     31c:	0f 88 92 00 00 00    	js     3b4 <openiputtest+0xd4>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     322:	75 34                	jne    358 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     324:	83 ec 08             	sub    $0x8,%esp
     327:	6a 02                	push   $0x2
     329:	68 ef 3d 00 00       	push   $0x3def
     32e:	e8 ef 35 00 00       	call   3922 <open>
    if(fd >= 0){
     333:	83 c4 10             	add    $0x10,%esp
     336:	85 c0                	test   %eax,%eax
     338:	78 5e                	js     398 <openiputtest+0xb8>
      printf(stdout, "open directory for write succeeded\n");
     33a:	83 ec 08             	sub    $0x8,%esp
     33d:	68 50 4d 00 00       	push   $0x4d50
     342:	ff 35 98 5d 00 00    	pushl  0x5d98
     348:	e8 e3 36 00 00       	call   3a30 <printf>
      exit();
     34d:	e8 90 35 00 00       	call   38e2 <exit>
     352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     358:	83 ec 0c             	sub    $0xc,%esp
     35b:	6a 01                	push   $0x1
     35d:	e8 10 36 00 00       	call   3972 <sleep>
  if(unlink("oidir") != 0){
     362:	c7 04 24 ef 3d 00 00 	movl   $0x3def,(%esp)
     369:	e8 c4 35 00 00       	call   3932 <unlink>
     36e:	83 c4 10             	add    $0x10,%esp
     371:	85 c0                	test   %eax,%eax
     373:	75 56                	jne    3cb <openiputtest+0xeb>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     375:	e8 70 35 00 00       	call   38ea <wait>
  printf(stdout, "openiput test ok\n");
     37a:	83 ec 08             	sub    $0x8,%esp
     37d:	68 18 3e 00 00       	push   $0x3e18
     382:	ff 35 98 5d 00 00    	pushl  0x5d98
     388:	e8 a3 36 00 00       	call   3a30 <printf>
}
     38d:	83 c4 10             	add    $0x10,%esp
     390:	c9                   	leave  
     391:	c3                   	ret    
     392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     398:	e8 45 35 00 00       	call   38e2 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     39d:	51                   	push   %ecx
     39e:	51                   	push   %ecx
     39f:	68 f5 3d 00 00       	push   $0x3df5
     3a4:	ff 35 98 5d 00 00    	pushl  0x5d98
     3aa:	e8 81 36 00 00       	call   3a30 <printf>
    exit();
     3af:	e8 2e 35 00 00       	call   38e2 <exit>
  }
  pid = fork(0);
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3b4:	52                   	push   %edx
     3b5:	52                   	push   %edx
     3b6:	68 91 4c 00 00       	push   $0x4c91
     3bb:	ff 35 98 5d 00 00    	pushl  0x5d98
     3c1:	e8 6a 36 00 00       	call   3a30 <printf>
    exit();
     3c6:	e8 17 35 00 00       	call   38e2 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3cb:	50                   	push   %eax
     3cc:	50                   	push   %eax
     3cd:	68 09 3e 00 00       	push   $0x3e09
     3d2:	ff 35 98 5d 00 00    	pushl  0x5d98
     3d8:	e8 53 36 00 00       	call   3a30 <printf>
    exit();
     3dd:	e8 00 35 00 00       	call   38e2 <exit>
     3e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 2a 3e 00 00       	push   $0x3e2a
     3fb:	ff 35 98 5d 00 00    	pushl  0x5d98
     401:	e8 2a 36 00 00       	call   3a30 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 35 3e 00 00       	push   $0x3e35
     40f:	e8 0e 35 00 00       	call   3922 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 e6 34 00 00       	call   390a <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 4d 3e 00 00       	push   $0x3e4d
     42d:	e8 f0 34 00 00       	call   3922 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 78 3e 00 00       	push   $0x3e78
     441:	ff 35 98 5d 00 00    	pushl  0x5d98
     447:	e8 e4 35 00 00       	call   3a30 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 3a 3e 00 00       	push   $0x3e3a
     458:	ff 35 98 5d 00 00    	pushl  0x5d98
     45e:	e8 cd 35 00 00       	call   3a30 <printf>
    exit();
     463:	e8 7a 34 00 00       	call   38e2 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 5a 3e 00 00       	push   $0x3e5a
     46f:	ff 35 98 5d 00 00    	pushl  0x5d98
     475:	e8 b6 35 00 00       	call   3a30 <printf>
    exit();
     47a:	e8 63 34 00 00       	call   38e2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 86 3e 00 00       	push   $0x3e86
     48d:	ff 35 98 5d 00 00    	pushl  0x5d98
     493:	e8 98 35 00 00       	call   3a30 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 97 3e 00 00       	push   $0x3e97
     4a4:	e8 79 34 00 00       	call   3922 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 8b 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 9d 3e 00 00       	push   $0x3e9d
     4c0:	ff 35 98 5d 00 00    	pushl  0x5d98
     4c6:	e8 65 35 00 00       	call   3a30 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 d4 3e 00 00       	push   $0x3ed4
     4da:	56                   	push   %esi
     4db:	e8 22 34 00 00       	call   3902 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 df 3e 00 00       	push   $0x3edf
     4f6:	56                   	push   %esi
     4f7:	e8 06 34 00 00       	call   3902 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 ea 3e 00 00       	push   $0x3eea
     518:	ff 35 98 5d 00 00    	pushl  0x5d98
     51e:	e8 0d 35 00 00       	call   3a30 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 df 33 00 00       	call   390a <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 97 3e 00 00       	push   $0x3e97
     534:	e8 e9 33 00 00       	call   3922 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 f5 3e 00 00       	push   $0x3ef5
     54e:	ff 35 98 5d 00 00    	pushl  0x5d98
     554:	e8 d7 34 00 00       	call   3a30 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 80 85 00 00       	push   $0x8580
     566:	53                   	push   %ebx
     567:	e8 8e 33 00 00       	call   38fa <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 29 3f 00 00       	push   $0x3f29
     582:	ff 35 98 5d 00 00    	pushl  0x5d98
     588:	e8 a3 34 00 00       	call   3a30 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 75 33 00 00       	call   390a <close>

  if(unlink("small") < 0){
     595:	c7 04 24 97 3e 00 00 	movl   $0x3e97,(%esp)
     59c:	e8 91 33 00 00       	call   3932 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 51 3f 00 00       	push   $0x3f51
     5b0:	ff 35 98 5d 00 00    	pushl  0x5d98
     5b6:	e8 75 34 00 00       	call   3a30 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 74 4d 00 00       	push   $0x4d74
     5ce:	ff 35 98 5d 00 00    	pushl  0x5d98
     5d4:	e8 57 34 00 00       	call   3a30 <printf>
      exit();
     5d9:	e8 04 33 00 00       	call   38e2 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 98 4d 00 00       	push   $0x4d98
     5e7:	ff 35 98 5d 00 00    	pushl  0x5d98
     5ed:	e8 3e 34 00 00       	call   3a30 <printf>
      exit();
     5f2:	e8 eb 32 00 00       	call   38e2 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 0e 3f 00 00       	push   $0x3f0e
     5ff:	ff 35 98 5d 00 00    	pushl  0x5d98
     605:	e8 26 34 00 00       	call   3a30 <printf>
    exit();
     60a:	e8 d3 32 00 00       	call   38e2 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 55 42 00 00       	push   $0x4255
     617:	ff 35 98 5d 00 00    	pushl  0x5d98
     61d:	e8 0e 34 00 00       	call   3a30 <printf>
    exit();
     622:	e8 bb 32 00 00       	call   38e2 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 3c 3f 00 00       	push   $0x3f3c
     62f:	ff 35 98 5d 00 00    	pushl  0x5d98
     635:	e8 f6 33 00 00       	call   3a30 <printf>
    exit();
     63a:	e8 a3 32 00 00       	call   38e2 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 b8 3e 00 00       	push   $0x3eb8
     647:	ff 35 98 5d 00 00    	pushl  0x5d98
     64d:	e8 de 33 00 00       	call   3a30 <printf>
    exit();
     652:	e8 8b 32 00 00       	call   38e2 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 65 3f 00 00       	push   $0x3f65
     66d:	ff 35 98 5d 00 00    	pushl  0x5d98
     673:	e8 b8 33 00 00       	call   3a30 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 df 3f 00 00       	push   $0x3fdf
     684:	e8 99 32 00 00       	call   3922 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 64 01 00 00    	js     7f8 <writetest1+0x198>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d 80 85 00 00    	mov    %ebx,0x8580
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 80 85 00 00       	push   $0x8580
     6b3:	56                   	push   %esi
     6b4:	e8 49 32 00 00       	call   3902 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 2f 32 00 00       	call   390a <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 df 3f 00 00       	push   $0x3fdf
     6e4:	e8 39 32 00 00       	call   3922 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 80 85 00 00       	mov    0x8580,%eax
     710:	39 c3                	cmp    %eax,%ebx
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 80 85 00 00       	push   $0x8580
     724:	56                   	push   %esi
     725:	e8 d0 31 00 00       	call   38fa <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 c4 31 00 00       	call   390a <close>
  if(unlink("big") < 0){
     746:	c7 04 24 df 3f 00 00 	movl   $0x3fdf,(%esp)
     74d:	e8 e0 31 00 00       	call   3932 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 06 40 00 00       	push   $0x4006
     765:	ff 35 98 5d 00 00    	pushl  0x5d98
     76b:	e8 c0 32 00 00       	call   3a30 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 8f 3f 00 00       	push   $0x3f8f
     783:	ff 35 98 5d 00 00    	pushl  0x5d98
     789:	e8 a2 32 00 00       	call   3a30 <printf>
      exit();
     78e:	e8 4f 31 00 00       	call   38e2 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 bc 4d 00 00       	push   $0x4dbc
     79a:	ff 35 98 5d 00 00    	pushl  0x5d98
     7a0:	e8 8b 32 00 00       	call   3a30 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 38 31 00 00       	call   38e2 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 e3 3f 00 00       	push   $0x3fe3
     7b3:	ff 35 98 5d 00 00    	pushl  0x5d98
     7b9:	e8 72 32 00 00       	call   3a30 <printf>
      exit();
     7be:	e8 1f 31 00 00       	call   38e2 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 c6 3f 00 00       	push   $0x3fc6
     7d0:	ff 35 98 5d 00 00    	pushl  0x5d98
     7d6:	e8 55 32 00 00       	call   3a30 <printf>
        exit();
     7db:	e8 02 31 00 00       	call   38e2 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 ad 3f 00 00       	push   $0x3fad
     7e8:	ff 35 98 5d 00 00    	pushl  0x5d98
     7ee:	e8 3d 32 00 00       	call   3a30 <printf>
    exit();
     7f3:	e8 ea 30 00 00       	call   38e2 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 75 3f 00 00       	push   $0x3f75
     800:	ff 35 98 5d 00 00    	pushl  0x5d98
     806:	e8 25 32 00 00       	call   3a30 <printf>
    exit();
     80b:	e8 d2 30 00 00       	call   38e2 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 f3 3f 00 00       	push   $0x3ff3
     818:	ff 35 98 5d 00 00    	pushl  0x5d98
     81e:	e8 0d 32 00 00       	call   3a30 <printf>
    exit();
     823:	e8 ba 30 00 00       	call   38e2 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 dc 4d 00 00       	push   $0x4ddc
     841:	ff 35 98 5d 00 00    	pushl  0x5d98
     847:	e8 e4 31 00 00       	call   3a30 <printf>

  name[0] = 'a';
     84c:	c6 05 80 a5 00 00 61 	movb   $0x61,0xa580
  name[2] = '\0';
     853:	c6 05 82 a5 00 00 00 	movb   $0x0,0xa582
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d 81 a5 00 00    	mov    %bl,0xa581
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 80 a5 00 00       	push   $0xa580
     876:	e8 a7 30 00 00       	call   3922 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 87 30 00 00       	call   390a <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 80 a5 00 00 61 	movb   $0x61,0xa580
  name[2] = '\0';
     892:	c6 05 82 a5 00 00 00 	movb   $0x0,0xa582
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d 81 a5 00 00    	mov    %bl,0xa581
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 80 a5 00 00       	push   $0xa580
     8b1:	e8 7c 30 00 00       	call   3932 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 04 4e 00 00       	push   $0x4e04
     8c6:	ff 35 98 5d 00 00    	pushl  0x5d98
     8cc:	e8 5f 31 00 00       	call   3a30 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 14 40 00 00       	push   $0x4014
     8eb:	ff 35 98 5d 00 00    	pushl  0x5d98
     8f1:	e8 3a 31 00 00       	call   3a30 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 20 40 00 00 	movl   $0x4020,(%esp)
     8fd:	e8 48 30 00 00       	call   394a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 20 40 00 00       	push   $0x4020
     911:	e8 3c 30 00 00       	call   3952 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 c5 45 00 00       	push   $0x45c5
     929:	e8 24 30 00 00       	call   3952 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 20 40 00 00       	push   $0x4020
     93d:	e8 f0 2f 00 00       	call   3932 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 5d 40 00 00       	push   $0x405d
     951:	ff 35 98 5d 00 00    	pushl  0x5d98
     957:	e8 d4 30 00 00       	call   3a30 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 50 3d 00 00       	push   $0x3d50
     968:	ff 35 98 5d 00 00    	pushl  0x5d98
     96e:	e8 bd 30 00 00       	call   3a30 <printf>
    exit();
     973:	e8 6a 2f 00 00       	call   38e2 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 49 40 00 00       	push   $0x4049
     97f:	ff 35 98 5d 00 00    	pushl  0x5d98
     985:	e8 a6 30 00 00       	call   3a30 <printf>
    exit();
     98a:	e8 53 2f 00 00       	call   38e2 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 38 40 00 00       	push   $0x4038
     996:	ff 35 98 5d 00 00    	pushl  0x5d98
     99c:	e8 8f 30 00 00       	call   3a30 <printf>
    exit();
     9a1:	e8 3c 2f 00 00       	call   38e2 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 25 40 00 00       	push   $0x4025
     9ad:	ff 35 98 5d 00 00    	pushl  0x5d98
     9b3:	e8 78 30 00 00       	call   3a30 <printf>
    exit();
     9b8:	e8 25 2f 00 00       	call   38e2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 6c 40 00 00       	push   $0x406c
     9cb:	ff 35 98 5d 00 00    	pushl  0x5d98
     9d1:	e8 5a 30 00 00       	call   3a30 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 9c 5d 00 00       	push   $0x5d9c
     9dd:	68 35 3e 00 00       	push   $0x3e35
     9e2:	e8 33 2f 00 00       	call   391a <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 77 40 00 00       	push   $0x4077
     9f7:	ff 35 98 5d 00 00    	pushl  0x5d98
     9fd:	e8 2e 30 00 00       	call   3a30 <printf>
    exit();
     a02:	e8 db 2e 00 00       	call   38e2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 d0 2e 00 00       	call   38f2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 45 01 00 00    	jne    b72 <pipe1+0x162>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork(0);
     a2d:	83 ec 0c             	sub    $0xc,%esp
     a30:	6a 00                	push   $0x0
     a32:	e8 a3 2e 00 00       	call   38da <fork>
  seq = 0;
  if(pid == 0){
     a37:	83 c4 10             	add    $0x10,%esp
     a3a:	83 f8 00             	cmp    $0x0,%eax
     a3d:	0f 84 8e 00 00 00    	je     ad1 <pipe1+0xc1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a43:	0f 8e 3d 01 00 00    	jle    b86 <pipe1+0x176>
    close(fds[1]);
     a49:	83 ec 0c             	sub    $0xc,%esp
     a4c:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a4f:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork(0);
  seq = 0;
     a54:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a56:	e8 af 2e 00 00       	call   390a <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5b:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a5e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a65:	83 ec 04             	sub    $0x4,%esp
     a68:	57                   	push   %edi
     a69:	68 80 85 00 00       	push   $0x8580
     a6e:	ff 75 e0             	pushl  -0x20(%ebp)
     a71:	e8 84 2e 00 00       	call   38fa <read>
     a76:	83 c4 10             	add    $0x10,%esp
     a79:	85 c0                	test   %eax,%eax
     a7b:	0f 8e ab 00 00 00    	jle    b2c <pipe1+0x11c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a81:	89 d9                	mov    %ebx,%ecx
     a83:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a86:	f7 d9                	neg    %ecx
     a88:	90                   	nop
     a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a90:	38 9c 0b 80 85 00 00 	cmp    %bl,0x8580(%ebx,%ecx,1)
     a97:	8d 53 01             	lea    0x1(%ebx),%edx
     a9a:	75 1b                	jne    ab7 <pipe1+0xa7>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a9c:	39 f2                	cmp    %esi,%edx
     a9e:	89 d3                	mov    %edx,%ebx
     aa0:	75 ee                	jne    a90 <pipe1+0x80>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     aa2:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     aa4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     aa7:	b8 00 20 00 00       	mov    $0x2000,%eax
     aac:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     ab2:	0f 4f f8             	cmovg  %eax,%edi
     ab5:	eb ae                	jmp    a65 <pipe1+0x55>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     ab7:	83 ec 08             	sub    $0x8,%esp
     aba:	68 a6 40 00 00       	push   $0x40a6
     abf:	6a 01                	push   $0x1
     ac1:	e8 6a 2f 00 00       	call   3a30 <printf>
          return;
     ac6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ac9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     acc:	5b                   	pop    %ebx
     acd:	5e                   	pop    %esi
     ace:	5f                   	pop    %edi
     acf:	5d                   	pop    %ebp
     ad0:	c3                   	ret    
    exit();
  }
  pid = fork(0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ad1:	83 ec 0c             	sub    $0xc,%esp
     ad4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork(0);
  seq = 0;
     ad7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ad9:	e8 2c 2e 00 00       	call   390a <close>
     ade:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ae1:	89 f0                	mov    %esi,%eax
     ae3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ae9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     aeb:	f7 d8                	neg    %eax
     aed:	8d 76 00             	lea    0x0(%esi),%esi
     af0:	88 9c 18 80 85 00 00 	mov    %bl,0x8580(%eax,%ebx,1)
     af7:	83 c3 01             	add    $0x1,%ebx
  pid = fork(0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     afa:	39 d3                	cmp    %edx,%ebx
     afc:	75 f2                	jne    af0 <pipe1+0xe0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     afe:	83 ec 04             	sub    $0x4,%esp
     b01:	89 de                	mov    %ebx,%esi
     b03:	68 09 04 00 00       	push   $0x409
     b08:	68 80 85 00 00       	push   $0x8580
     b0d:	ff 75 e4             	pushl  -0x1c(%ebp)
     b10:	e8 ed 2d 00 00       	call   3902 <write>
     b15:	83 c4 10             	add    $0x10,%esp
     b18:	3d 09 04 00 00       	cmp    $0x409,%eax
     b1d:	75 7b                	jne    b9a <pipe1+0x18a>
  }
  pid = fork(0);
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b1f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b25:	75 ba                	jne    ae1 <pipe1+0xd1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b27:	e8 b6 2d 00 00       	call   38e2 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b2c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b33:	75 26                	jne    b5b <pipe1+0x14b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b35:	83 ec 0c             	sub    $0xc,%esp
     b38:	ff 75 e0             	pushl  -0x20(%ebp)
     b3b:	e8 ca 2d 00 00       	call   390a <close>
    wait();
     b40:	e8 a5 2d 00 00       	call   38ea <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b45:	58                   	pop    %eax
     b46:	5a                   	pop    %edx
     b47:	68 cb 40 00 00       	push   $0x40cb
     b4c:	6a 01                	push   $0x1
     b4e:	e8 dd 2e 00 00       	call   3a30 <printf>
     b53:	83 c4 10             	add    $0x10,%esp
     b56:	e9 6e ff ff ff       	jmp    ac9 <pipe1+0xb9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b5b:	83 ec 04             	sub    $0x4,%esp
     b5e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b61:	68 b4 40 00 00       	push   $0x40b4
     b66:	6a 01                	push   $0x1
     b68:	e8 c3 2e 00 00       	call   3a30 <printf>
      exit();
     b6d:	e8 70 2d 00 00       	call   38e2 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b72:	83 ec 08             	sub    $0x8,%esp
     b75:	68 89 40 00 00       	push   $0x4089
     b7a:	6a 01                	push   $0x1
     b7c:	e8 af 2e 00 00       	call   3a30 <printf>
    exit();
     b81:	e8 5c 2d 00 00       	call   38e2 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b86:	83 ec 08             	sub    $0x8,%esp
     b89:	68 d5 40 00 00       	push   $0x40d5
     b8e:	6a 01                	push   $0x1
     b90:	e8 9b 2e 00 00       	call   3a30 <printf>
    exit();
     b95:	e8 48 2d 00 00       	call   38e2 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b9a:	83 ec 08             	sub    $0x8,%esp
     b9d:	68 98 40 00 00       	push   $0x4098
     ba2:	6a 01                	push   $0x1
     ba4:	e8 87 2e 00 00       	call   3a30 <printf>
        exit();
     ba9:	e8 34 2d 00 00       	call   38e2 <exit>
     bae:	66 90                	xchg   %ax,%ax

00000bb0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bb9:	68 e4 40 00 00       	push   $0x40e4
     bbe:	6a 01                	push   $0x1
     bc0:	e8 6b 2e 00 00       	call   3a30 <printf>
  pid1 = fork(0);
     bc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bcc:	e8 09 2d 00 00       	call   38da <fork>
  if(pid1 == 0)
     bd1:	83 c4 10             	add    $0x10,%esp
     bd4:	85 c0                	test   %eax,%eax
     bd6:	75 02                	jne    bda <preempt+0x2a>
     bd8:	eb fe                	jmp    bd8 <preempt+0x28>
    for(;;)
      ;

  pid2 = fork(0);
     bda:	83 ec 0c             	sub    $0xc,%esp
     bdd:	89 c7                	mov    %eax,%edi
     bdf:	6a 00                	push   $0x0
     be1:	e8 f4 2c 00 00       	call   38da <fork>
  if(pid2 == 0)
     be6:	83 c4 10             	add    $0x10,%esp
     be9:	85 c0                	test   %eax,%eax
  pid1 = fork(0);
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork(0);
     beb:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bed:	75 02                	jne    bf1 <preempt+0x41>
     bef:	eb fe                	jmp    bef <preempt+0x3f>
    for(;;)
      ;

  pipe(pfds);
     bf1:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bf4:	83 ec 0c             	sub    $0xc,%esp
     bf7:	50                   	push   %eax
     bf8:	e8 f5 2c 00 00       	call   38f2 <pipe>
  pid3 = fork(0);
     bfd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c04:	e8 d1 2c 00 00       	call   38da <fork>
  if(pid3 == 0){
     c09:	83 c4 10             	add    $0x10,%esp
     c0c:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork(0);
     c0e:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     c10:	75 47                	jne    c59 <preempt+0xa9>
    close(pfds[0]);
     c12:	83 ec 0c             	sub    $0xc,%esp
     c15:	ff 75 e0             	pushl  -0x20(%ebp)
     c18:	e8 ed 2c 00 00       	call   390a <close>
    if(write(pfds[1], "x", 1) != 1)
     c1d:	83 c4 0c             	add    $0xc,%esp
     c20:	6a 01                	push   $0x1
     c22:	68 a9 46 00 00       	push   $0x46a9
     c27:	ff 75 e4             	pushl  -0x1c(%ebp)
     c2a:	e8 d3 2c 00 00       	call   3902 <write>
     c2f:	83 c4 10             	add    $0x10,%esp
     c32:	83 f8 01             	cmp    $0x1,%eax
     c35:	74 12                	je     c49 <preempt+0x99>
      printf(1, "preempt write error");
     c37:	83 ec 08             	sub    $0x8,%esp
     c3a:	68 ee 40 00 00       	push   $0x40ee
     c3f:	6a 01                	push   $0x1
     c41:	e8 ea 2d 00 00       	call   3a30 <printf>
     c46:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c49:	83 ec 0c             	sub    $0xc,%esp
     c4c:	ff 75 e4             	pushl  -0x1c(%ebp)
     c4f:	e8 b6 2c 00 00       	call   390a <close>
     c54:	83 c4 10             	add    $0x10,%esp
     c57:	eb fe                	jmp    c57 <preempt+0xa7>
    for(;;)
      ;
  }

  close(pfds[1]);
     c59:	83 ec 0c             	sub    $0xc,%esp
     c5c:	ff 75 e4             	pushl  -0x1c(%ebp)
     c5f:	e8 a6 2c 00 00       	call   390a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c64:	83 c4 0c             	add    $0xc,%esp
     c67:	68 00 20 00 00       	push   $0x2000
     c6c:	68 80 85 00 00       	push   $0x8580
     c71:	ff 75 e0             	pushl  -0x20(%ebp)
     c74:	e8 81 2c 00 00       	call   38fa <read>
     c79:	83 c4 10             	add    $0x10,%esp
     c7c:	83 f8 01             	cmp    $0x1,%eax
     c7f:	74 1a                	je     c9b <preempt+0xeb>
    printf(1, "preempt read error");
     c81:	83 ec 08             	sub    $0x8,%esp
     c84:	68 02 41 00 00       	push   $0x4102
     c89:	6a 01                	push   $0x1
     c8b:	e8 a0 2d 00 00       	call   3a30 <printf>
    return;
     c90:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c93:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c96:	5b                   	pop    %ebx
     c97:	5e                   	pop    %esi
     c98:	5f                   	pop    %edi
     c99:	5d                   	pop    %ebp
     c9a:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c9b:	83 ec 0c             	sub    $0xc,%esp
     c9e:	ff 75 e0             	pushl  -0x20(%ebp)
     ca1:	e8 64 2c 00 00       	call   390a <close>
  printf(1, "kill... ");
     ca6:	58                   	pop    %eax
     ca7:	5a                   	pop    %edx
     ca8:	68 15 41 00 00       	push   $0x4115
     cad:	6a 01                	push   $0x1
     caf:	e8 7c 2d 00 00       	call   3a30 <printf>
  kill(pid1);
     cb4:	89 3c 24             	mov    %edi,(%esp)
     cb7:	e8 56 2c 00 00       	call   3912 <kill>
  kill(pid2);
     cbc:	89 34 24             	mov    %esi,(%esp)
     cbf:	e8 4e 2c 00 00       	call   3912 <kill>
  kill(pid3);
     cc4:	89 1c 24             	mov    %ebx,(%esp)
     cc7:	e8 46 2c 00 00       	call   3912 <kill>
  printf(1, "wait... ");
     ccc:	59                   	pop    %ecx
     ccd:	5b                   	pop    %ebx
     cce:	68 1e 41 00 00       	push   $0x411e
     cd3:	6a 01                	push   $0x1
     cd5:	e8 56 2d 00 00       	call   3a30 <printf>
  wait();
     cda:	e8 0b 2c 00 00       	call   38ea <wait>
  wait();
     cdf:	e8 06 2c 00 00       	call   38ea <wait>
  wait();
     ce4:	e8 01 2c 00 00       	call   38ea <wait>
  printf(1, "preempt ok\n");
     ce9:	5e                   	pop    %esi
     cea:	5f                   	pop    %edi
     ceb:	68 27 41 00 00       	push   $0x4127
     cf0:	6a 01                	push   $0x1
     cf2:	e8 39 2d 00 00       	call   3a30 <printf>
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	eb 97                	jmp    c93 <preempt+0xe3>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d00 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	56                   	push   %esi
     d04:	be 64 00 00 00       	mov    $0x64,%esi
     d09:	53                   	push   %ebx
     d0a:	eb 14                	jmp    d20 <exitwait+0x20>
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork(0);
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     d10:	74 77                	je     d89 <exitwait+0x89>
      if(wait() != pid){
     d12:	e8 d3 2b 00 00       	call   38ea <wait>
     d17:	39 c3                	cmp    %eax,%ebx
     d19:	75 35                	jne    d50 <exitwait+0x50>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d1b:	83 ee 01             	sub    $0x1,%esi
     d1e:	74 50                	je     d70 <exitwait+0x70>
    pid = fork(0);
     d20:	83 ec 0c             	sub    $0xc,%esp
     d23:	6a 00                	push   $0x0
     d25:	e8 b0 2b 00 00       	call   38da <fork>
    if(pid < 0){
     d2a:	83 c4 10             	add    $0x10,%esp
     d2d:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork(0);
     d2f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d31:	79 dd                	jns    d10 <exitwait+0x10>
      printf(1, "fork failed\n");
     d33:	83 ec 08             	sub    $0x8,%esp
     d36:	68 91 4c 00 00       	push   $0x4c91
     d3b:	6a 01                	push   $0x1
     d3d:	e8 ee 2c 00 00       	call   3a30 <printf>
      return;
     d42:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d45:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d48:	5b                   	pop    %ebx
     d49:	5e                   	pop    %esi
     d4a:	5d                   	pop    %ebp
     d4b:	c3                   	ret    
     d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d50:	83 ec 08             	sub    $0x8,%esp
     d53:	68 33 41 00 00       	push   $0x4133
     d58:	6a 01                	push   $0x1
     d5a:	e8 d1 2c 00 00       	call   3a30 <printf>
        return;
     d5f:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d62:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d65:	5b                   	pop    %ebx
     d66:	5e                   	pop    %esi
     d67:	5d                   	pop    %ebp
     d68:	c3                   	ret    
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d70:	83 ec 08             	sub    $0x8,%esp
     d73:	68 43 41 00 00       	push   $0x4143
     d78:	6a 01                	push   $0x1
     d7a:	e8 b1 2c 00 00       	call   3a30 <printf>
     d7f:	83 c4 10             	add    $0x10,%esp
}
     d82:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d85:	5b                   	pop    %ebx
     d86:	5e                   	pop    %esi
     d87:	5d                   	pop    %ebp
     d88:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d89:	e8 54 2b 00 00       	call   38e2 <exit>
     d8e:	66 90                	xchg   %ax,%ax

00000d90 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	57                   	push   %edi
     d94:	56                   	push   %esi
     d95:	53                   	push   %ebx
     d96:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d99:	68 50 41 00 00       	push   $0x4150
     d9e:	6a 01                	push   $0x1
     da0:	e8 8b 2c 00 00       	call   3a30 <printf>
  ppid = getpid();
     da5:	e8 b8 2b 00 00       	call   3962 <getpid>
  if((pid = fork(0)) == 0){
     daa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
{
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
  ppid = getpid();
     db1:	89 c6                	mov    %eax,%esi
  if((pid = fork(0)) == 0){
     db3:	e8 22 2b 00 00       	call   38da <fork>
     db8:	83 c4 10             	add    $0x10,%esp
     dbb:	85 c0                	test   %eax,%eax
     dbd:	75 71                	jne    e30 <mem+0xa0>
     dbf:	31 db                	xor    %ebx,%ebx
     dc1:	eb 09                	jmp    dcc <mem+0x3c>
     dc3:	90                   	nop
     dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     dc8:	89 18                	mov    %ebx,(%eax)
     dca:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork(0)) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     dcc:	83 ec 0c             	sub    $0xc,%esp
     dcf:	68 11 27 00 00       	push   $0x2711
     dd4:	e8 87 2e 00 00       	call   3c60 <malloc>
     dd9:	83 c4 10             	add    $0x10,%esp
     ddc:	85 c0                	test   %eax,%eax
     dde:	75 e8                	jne    dc8 <mem+0x38>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     de0:	85 db                	test   %ebx,%ebx
     de2:	74 18                	je     dfc <mem+0x6c>
     de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     de8:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dea:	83 ec 0c             	sub    $0xc,%esp
     ded:	53                   	push   %ebx
     dee:	89 fb                	mov    %edi,%ebx
     df0:	e8 db 2d 00 00       	call   3bd0 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     df5:	83 c4 10             	add    $0x10,%esp
     df8:	85 db                	test   %ebx,%ebx
     dfa:	75 ec                	jne    de8 <mem+0x58>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     dfc:	83 ec 0c             	sub    $0xc,%esp
     dff:	68 00 50 00 00       	push   $0x5000
     e04:	e8 57 2e 00 00       	call   3c60 <malloc>
    if(m1 == 0){
     e09:	83 c4 10             	add    $0x10,%esp
     e0c:	85 c0                	test   %eax,%eax
     e0e:	74 30                	je     e40 <mem+0xb0>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     e10:	83 ec 0c             	sub    $0xc,%esp
     e13:	50                   	push   %eax
     e14:	e8 b7 2d 00 00       	call   3bd0 <free>
    printf(1, "mem ok\n");
     e19:	58                   	pop    %eax
     e1a:	5a                   	pop    %edx
     e1b:	68 74 41 00 00       	push   $0x4174
     e20:	6a 01                	push   $0x1
     e22:	e8 09 2c 00 00       	call   3a30 <printf>
    exit();
     e27:	e8 b6 2a 00 00       	call   38e2 <exit>
     e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e30:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e33:	5b                   	pop    %ebx
     e34:	5e                   	pop    %esi
     e35:	5f                   	pop    %edi
     e36:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e37:	e9 ae 2a 00 00       	jmp    38ea <wait>
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e40:	83 ec 08             	sub    $0x8,%esp
     e43:	68 5a 41 00 00       	push   $0x415a
     e48:	6a 01                	push   $0x1
     e4a:	e8 e1 2b 00 00       	call   3a30 <printf>
      kill(ppid);
     e4f:	89 34 24             	mov    %esi,(%esp)
     e52:	e8 bb 2a 00 00       	call   3912 <kill>
      exit();
     e57:	e8 86 2a 00 00       	call   38e2 <exit>
     e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e60 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	57                   	push   %edi
     e64:	56                   	push   %esi
     e65:	53                   	push   %ebx
     e66:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e69:	68 7c 41 00 00       	push   $0x417c
     e6e:	6a 01                	push   $0x1
     e70:	e8 bb 2b 00 00       	call   3a30 <printf>

  unlink("sharedfd");
     e75:	c7 04 24 8b 41 00 00 	movl   $0x418b,(%esp)
     e7c:	e8 b1 2a 00 00       	call   3932 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e81:	5b                   	pop    %ebx
     e82:	5e                   	pop    %esi
     e83:	68 02 02 00 00       	push   $0x202
     e88:	68 8b 41 00 00       	push   $0x418b
     e8d:	e8 90 2a 00 00       	call   3922 <open>
  if(fd < 0){
     e92:	83 c4 10             	add    $0x10,%esp
     e95:	85 c0                	test   %eax,%eax
     e97:	0f 88 29 01 00 00    	js     fc6 <sharedfd+0x166>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0);
     e9d:	83 ec 0c             	sub    $0xc,%esp
     ea0:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ea2:	8d 75 de             	lea    -0x22(%ebp),%esi
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0);
     ea5:	6a 00                	push   $0x0
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ea7:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0);
     eac:	e8 29 2a 00 00       	call   38da <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eb1:	83 c4 0c             	add    $0xc,%esp
     eb4:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork(0);
     eb7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eba:	19 c0                	sbb    %eax,%eax
     ebc:	6a 0a                	push   $0xa
     ebe:	83 e0 f3             	and    $0xfffffff3,%eax
     ec1:	83 c0 70             	add    $0x70,%eax
     ec4:	50                   	push   %eax
     ec5:	56                   	push   %esi
     ec6:	e8 85 28 00 00       	call   3750 <memset>
     ecb:	83 c4 10             	add    $0x10,%esp
     ece:	eb 05                	jmp    ed5 <sharedfd+0x75>
  for(i = 0; i < 1000; i++){
     ed0:	83 eb 01             	sub    $0x1,%ebx
     ed3:	74 26                	je     efb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ed5:	83 ec 04             	sub    $0x4,%esp
     ed8:	6a 0a                	push   $0xa
     eda:	56                   	push   %esi
     edb:	57                   	push   %edi
     edc:	e8 21 2a 00 00       	call   3902 <write>
     ee1:	83 c4 10             	add    $0x10,%esp
     ee4:	83 f8 0a             	cmp    $0xa,%eax
     ee7:	74 e7                	je     ed0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ee9:	83 ec 08             	sub    $0x8,%esp
     eec:	68 58 4e 00 00       	push   $0x4e58
     ef1:	6a 01                	push   $0x1
     ef3:	e8 38 2b 00 00       	call   3a30 <printf>
      break;
     ef8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     efb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     efe:	85 c9                	test   %ecx,%ecx
     f00:	0f 84 f4 00 00 00    	je     ffa <sharedfd+0x19a>
    exit();
  else
    wait();
     f06:	e8 df 29 00 00       	call   38ea <wait>
  close(fd);
     f0b:	83 ec 0c             	sub    $0xc,%esp
     f0e:	31 db                	xor    %ebx,%ebx
     f10:	57                   	push   %edi
     f11:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f14:	e8 f1 29 00 00       	call   390a <close>
  fd = open("sharedfd", 0);
     f19:	58                   	pop    %eax
     f1a:	5a                   	pop    %edx
     f1b:	6a 00                	push   $0x0
     f1d:	68 8b 41 00 00       	push   $0x418b
     f22:	e8 fb 29 00 00       	call   3922 <open>
  if(fd < 0){
     f27:	83 c4 10             	add    $0x10,%esp
     f2a:	31 d2                	xor    %edx,%edx
     f2c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f2e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f31:	0f 88 a9 00 00 00    	js     fe0 <sharedfd+0x180>
     f37:	89 f6                	mov    %esi,%esi
     f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f40:	83 ec 04             	sub    $0x4,%esp
     f43:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f46:	6a 0a                	push   $0xa
     f48:	56                   	push   %esi
     f49:	ff 75 d0             	pushl  -0x30(%ebp)
     f4c:	e8 a9 29 00 00       	call   38fa <read>
     f51:	83 c4 10             	add    $0x10,%esp
     f54:	85 c0                	test   %eax,%eax
     f56:	7e 27                	jle    f7f <sharedfd+0x11f>
     f58:	89 f0                	mov    %esi,%eax
     f5a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f5d:	eb 13                	jmp    f72 <sharedfd+0x112>
     f5f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f60:	80 f9 70             	cmp    $0x70,%cl
     f63:	0f 94 c1             	sete   %cl
     f66:	0f b6 c9             	movzbl %cl,%ecx
     f69:	01 cb                	add    %ecx,%ebx
     f6b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f6e:	39 c7                	cmp    %eax,%edi
     f70:	74 ce                	je     f40 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f72:	0f b6 08             	movzbl (%eax),%ecx
     f75:	80 f9 63             	cmp    $0x63,%cl
     f78:	75 e6                	jne    f60 <sharedfd+0x100>
        nc++;
     f7a:	83 c2 01             	add    $0x1,%edx
     f7d:	eb ec                	jmp    f6b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f7f:	83 ec 0c             	sub    $0xc,%esp
     f82:	ff 75 d0             	pushl  -0x30(%ebp)
     f85:	e8 80 29 00 00       	call   390a <close>
  unlink("sharedfd");
     f8a:	c7 04 24 8b 41 00 00 	movl   $0x418b,(%esp)
     f91:	e8 9c 29 00 00       	call   3932 <unlink>
  if(nc == 10000 && np == 10000){
     f96:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f99:	83 c4 10             	add    $0x10,%esp
     f9c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     fa2:	75 5b                	jne    fff <sharedfd+0x19f>
     fa4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     faa:	75 53                	jne    fff <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     fac:	83 ec 08             	sub    $0x8,%esp
     faf:	68 94 41 00 00       	push   $0x4194
     fb4:	6a 01                	push   $0x1
     fb6:	e8 75 2a 00 00       	call   3a30 <printf>
     fbb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc1:	5b                   	pop    %ebx
     fc2:	5e                   	pop    %esi
     fc3:	5f                   	pop    %edi
     fc4:	5d                   	pop    %ebp
     fc5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fc6:	83 ec 08             	sub    $0x8,%esp
     fc9:	68 2c 4e 00 00       	push   $0x4e2c
     fce:	6a 01                	push   $0x1
     fd0:	e8 5b 2a 00 00       	call   3a30 <printf>
    return;
     fd5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fdb:	5b                   	pop    %ebx
     fdc:	5e                   	pop    %esi
     fdd:	5f                   	pop    %edi
     fde:	5d                   	pop    %ebp
     fdf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fe0:	83 ec 08             	sub    $0x8,%esp
     fe3:	68 78 4e 00 00       	push   $0x4e78
     fe8:	6a 01                	push   $0x1
     fea:	e8 41 2a 00 00       	call   3a30 <printf>
    return;
     fef:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     ff2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ff5:	5b                   	pop    %ebx
     ff6:	5e                   	pop    %esi
     ff7:	5f                   	pop    %edi
     ff8:	5d                   	pop    %ebp
     ff9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     ffa:	e8 e3 28 00 00       	call   38e2 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fff:	53                   	push   %ebx
    1000:	52                   	push   %edx
    1001:	68 a1 41 00 00       	push   $0x41a1
    1006:	6a 01                	push   $0x1
    1008:	e8 23 2a 00 00       	call   3a30 <printf>
    exit();
    100d:	e8 d0 28 00 00       	call   38e2 <exit>
    1012:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001020 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	57                   	push   %edi
    1024:	56                   	push   %esi
    1025:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1026:	be b6 41 00 00       	mov    $0x41b6,%esi

  for(pi = 0; pi < 4; pi++){
    102b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    102d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1030:	c7 45 d8 b6 41 00 00 	movl   $0x41b6,-0x28(%ebp)
    1037:	c7 45 dc ff 42 00 00 	movl   $0x42ff,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    103e:	68 bc 41 00 00       	push   $0x41bc
    1043:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1045:	c7 45 e0 03 43 00 00 	movl   $0x4303,-0x20(%ebp)
    104c:	c7 45 e4 b9 41 00 00 	movl   $0x41b9,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1053:	e8 d8 29 00 00       	call   3a30 <printf>
    1058:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    105b:	83 ec 0c             	sub    $0xc,%esp
    105e:	56                   	push   %esi
    105f:	e8 ce 28 00 00       	call   3932 <unlink>

    pid = fork(0);
    1064:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    106b:	e8 6a 28 00 00       	call   38da <fork>
    if(pid < 0){
    1070:	83 c4 10             	add    $0x10,%esp
    1073:	85 c0                	test   %eax,%eax
    1075:	0f 88 84 01 00 00    	js     11ff <fourfiles+0x1df>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    107b:	0f 84 e4 00 00 00    	je     1165 <fourfiles+0x145>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    1081:	83 c3 01             	add    $0x1,%ebx
    1084:	83 fb 04             	cmp    $0x4,%ebx
    1087:	74 06                	je     108f <fourfiles+0x6f>
    1089:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    108d:	eb cc                	jmp    105b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    108f:	e8 56 28 00 00       	call   38ea <wait>
    1094:	bf 30 00 00 00       	mov    $0x30,%edi
    1099:	e8 4c 28 00 00       	call   38ea <wait>
    109e:	e8 47 28 00 00       	call   38ea <wait>
    10a3:	e8 42 28 00 00       	call   38ea <wait>
    10a8:	c7 45 d4 b6 41 00 00 	movl   $0x41b6,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10af:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10b2:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10b4:	6a 00                	push   $0x0
    10b6:	ff 75 d4             	pushl  -0x2c(%ebp)
    10b9:	e8 64 28 00 00       	call   3922 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10be:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10c1:	89 c6                	mov    %eax,%esi
    10c3:	90                   	nop
    10c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10c8:	83 ec 04             	sub    $0x4,%esp
    10cb:	68 00 20 00 00       	push   $0x2000
    10d0:	68 80 85 00 00       	push   $0x8580
    10d5:	56                   	push   %esi
    10d6:	e8 1f 28 00 00       	call   38fa <read>
    10db:	83 c4 10             	add    $0x10,%esp
    10de:	85 c0                	test   %eax,%eax
    10e0:	7e 1c                	jle    10fe <fourfiles+0xde>
    10e2:	31 d2                	xor    %edx,%edx
    10e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10e8:	0f be 8a 80 85 00 00 	movsbl 0x8580(%edx),%ecx
    10ef:	39 cf                	cmp    %ecx,%edi
    10f1:	75 5e                	jne    1151 <fourfiles+0x131>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10f3:	83 c2 01             	add    $0x1,%edx
    10f6:	39 d0                	cmp    %edx,%eax
    10f8:	75 ee                	jne    10e8 <fourfiles+0xc8>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10fa:	01 c3                	add    %eax,%ebx
    10fc:	eb ca                	jmp    10c8 <fourfiles+0xa8>
    }
    close(fd);
    10fe:	83 ec 0c             	sub    $0xc,%esp
    1101:	56                   	push   %esi
    1102:	e8 03 28 00 00       	call   390a <close>
    if(total != 12*500){
    1107:	83 c4 10             	add    $0x10,%esp
    110a:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1110:	0f 85 d4 00 00 00    	jne    11ea <fourfiles+0x1ca>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    1116:	83 ec 0c             	sub    $0xc,%esp
    1119:	ff 75 d4             	pushl  -0x2c(%ebp)
    111c:	83 c7 01             	add    $0x1,%edi
    111f:	e8 0e 28 00 00       	call   3932 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    1124:	83 c4 10             	add    $0x10,%esp
    1127:	83 ff 32             	cmp    $0x32,%edi
    112a:	75 1a                	jne    1146 <fourfiles+0x126>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    112c:	83 ec 08             	sub    $0x8,%esp
    112f:	68 fa 41 00 00       	push   $0x41fa
    1134:	6a 01                	push   $0x1
    1136:	e8 f5 28 00 00       	call   3a30 <printf>
}
    113b:	83 c4 10             	add    $0x10,%esp
    113e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1141:	5b                   	pop    %ebx
    1142:	5e                   	pop    %esi
    1143:	5f                   	pop    %edi
    1144:	5d                   	pop    %ebp
    1145:	c3                   	ret    
    1146:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1149:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    114c:	e9 5e ff ff ff       	jmp    10af <fourfiles+0x8f>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1151:	83 ec 08             	sub    $0x8,%esp
    1154:	68 dd 41 00 00       	push   $0x41dd
    1159:	6a 01                	push   $0x1
    115b:	e8 d0 28 00 00       	call   3a30 <printf>
          exit();
    1160:	e8 7d 27 00 00       	call   38e2 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1165:	83 ec 08             	sub    $0x8,%esp
    1168:	68 02 02 00 00       	push   $0x202
    116d:	56                   	push   %esi
    116e:	e8 af 27 00 00       	call   3922 <open>
      if(fd < 0){
    1173:	83 c4 10             	add    $0x10,%esp
    1176:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1178:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    117a:	78 5a                	js     11d6 <fourfiles+0x1b6>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    117c:	83 ec 04             	sub    $0x4,%esp
    117f:	83 c3 30             	add    $0x30,%ebx
    1182:	68 00 02 00 00       	push   $0x200
    1187:	53                   	push   %ebx
    1188:	bb 0c 00 00 00       	mov    $0xc,%ebx
    118d:	68 80 85 00 00       	push   $0x8580
    1192:	e8 b9 25 00 00       	call   3750 <memset>
    1197:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    119a:	83 ec 04             	sub    $0x4,%esp
    119d:	68 f4 01 00 00       	push   $0x1f4
    11a2:	68 80 85 00 00       	push   $0x8580
    11a7:	56                   	push   %esi
    11a8:	e8 55 27 00 00       	call   3902 <write>
    11ad:	83 c4 10             	add    $0x10,%esp
    11b0:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11b5:	75 0a                	jne    11c1 <fourfiles+0x1a1>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11b7:	83 eb 01             	sub    $0x1,%ebx
    11ba:	75 de                	jne    119a <fourfiles+0x17a>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11bc:	e8 21 27 00 00       	call   38e2 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    11c1:	83 ec 04             	sub    $0x4,%esp
    11c4:	50                   	push   %eax
    11c5:	68 cc 41 00 00       	push   $0x41cc
    11ca:	6a 01                	push   $0x1
    11cc:	e8 5f 28 00 00       	call   3a30 <printf>
          exit();
    11d1:	e8 0c 27 00 00       	call   38e2 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11d6:	83 ec 08             	sub    $0x8,%esp
    11d9:	68 57 44 00 00       	push   $0x4457
    11de:	6a 01                	push   $0x1
    11e0:	e8 4b 28 00 00       	call   3a30 <printf>
        exit();
    11e5:	e8 f8 26 00 00       	call   38e2 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11ea:	83 ec 04             	sub    $0x4,%esp
    11ed:	53                   	push   %ebx
    11ee:	68 e9 41 00 00       	push   $0x41e9
    11f3:	6a 01                	push   $0x1
    11f5:	e8 36 28 00 00       	call   3a30 <printf>
      exit();
    11fa:	e8 e3 26 00 00       	call   38e2 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork(0);
    if(pid < 0){
      printf(1, "fork failed\n");
    11ff:	83 ec 08             	sub    $0x8,%esp
    1202:	68 91 4c 00 00       	push   $0x4c91
    1207:	6a 01                	push   $0x1
    1209:	e8 22 28 00 00       	call   3a30 <printf>
      exit();
    120e:	e8 cf 26 00 00       	call   38e2 <exit>
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
    1225:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1226:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1228:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    122b:	68 08 42 00 00       	push   $0x4208
    1230:	6a 01                	push   $0x1
    1232:	e8 f9 27 00 00       	call   3a30 <printf>
    1237:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork(0);
    123a:	83 ec 0c             	sub    $0xc,%esp
    123d:	6a 00                	push   $0x0
    123f:	e8 96 26 00 00       	call   38da <fork>
    if(pid < 0){
    1244:	83 c4 10             	add    $0x10,%esp
    1247:	85 c0                	test   %eax,%eax
    1249:	0f 88 b7 01 00 00    	js     1406 <createdelete+0x1e6>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    124f:	0f 84 f6 00 00 00    	je     134b <createdelete+0x12b>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1255:	83 c3 01             	add    $0x1,%ebx
    1258:	83 fb 04             	cmp    $0x4,%ebx
    125b:	75 dd                	jne    123a <createdelete+0x1a>
    125d:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1260:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1262:	e8 83 26 00 00       	call   38ea <wait>
    1267:	e8 7e 26 00 00       	call   38ea <wait>
    126c:	e8 79 26 00 00       	call   38ea <wait>
    1271:	e8 74 26 00 00       	call   38ea <wait>
  }

  name[0] = name[1] = name[2] = 0;
    1276:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1280:	8d 46 30             	lea    0x30(%esi),%eax
    1283:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    1286:	bb 70 00 00 00       	mov    $0x70,%ebx
    128b:	0f 9f c2             	setg   %dl
    128e:	85 f6                	test   %esi,%esi
    1290:	88 45 c7             	mov    %al,-0x39(%ebp)
    1293:	0f 94 c0             	sete   %al
    1296:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1298:	8d 46 ff             	lea    -0x1(%esi),%eax
    129b:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    129e:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    12a1:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    12a5:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    12a8:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    12ab:	6a 00                	push   $0x0
    12ad:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    12ae:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    12b1:	e8 6c 26 00 00       	call   3922 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    12b6:	89 c1                	mov    %eax,%ecx
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	c1 e9 1f             	shr    $0x1f,%ecx
    12be:	84 c9                	test   %cl,%cl
    12c0:	74 0a                	je     12cc <createdelete+0xac>
    12c2:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12c6:	0f 85 11 01 00 00    	jne    13dd <createdelete+0x1bd>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12cc:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    12d0:	0f 86 44 01 00 00    	jbe    141a <createdelete+0x1fa>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    12d6:	85 c0                	test   %eax,%eax
    12d8:	78 0c                	js     12e6 <createdelete+0xc6>
        close(fd);
    12da:	83 ec 0c             	sub    $0xc,%esp
    12dd:	50                   	push   %eax
    12de:	e8 27 26 00 00       	call   390a <close>
    12e3:	83 c4 10             	add    $0x10,%esp
    12e6:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12e9:	80 fb 74             	cmp    $0x74,%bl
    12ec:	75 b3                	jne    12a1 <createdelete+0x81>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12ee:	83 c6 01             	add    $0x1,%esi
    12f1:	83 fe 14             	cmp    $0x14,%esi
    12f4:	75 8a                	jne    1280 <createdelete+0x60>
    12f6:	be 70 00 00 00       	mov    $0x70,%esi
    12fb:	90                   	nop
    12fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1300:	8d 46 c0             	lea    -0x40(%esi),%eax
    1303:	bb 04 00 00 00       	mov    $0x4,%ebx
    1308:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    130b:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    130d:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    1310:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1313:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    1317:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    1318:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    131b:	e8 12 26 00 00       	call   3932 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1320:	83 c4 10             	add    $0x10,%esp
    1323:	83 eb 01             	sub    $0x1,%ebx
    1326:	75 e3                	jne    130b <createdelete+0xeb>
    1328:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    132b:	89 f0                	mov    %esi,%eax
    132d:	3c 84                	cmp    $0x84,%al
    132f:	75 cf                	jne    1300 <createdelete+0xe0>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1331:	83 ec 08             	sub    $0x8,%esp
    1334:	68 1b 42 00 00       	push   $0x421b
    1339:	6a 01                	push   $0x1
    133b:	e8 f0 26 00 00       	call   3a30 <printf>
}
    1340:	83 c4 10             	add    $0x10,%esp
    1343:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1346:	5b                   	pop    %ebx
    1347:	5e                   	pop    %esi
    1348:	5f                   	pop    %edi
    1349:	5d                   	pop    %ebp
    134a:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    134b:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    134e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1352:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1357:	88 5d c8             	mov    %bl,-0x38(%ebp)
    135a:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    135d:	31 db                	xor    %ebx,%ebx
    135f:	eb 12                	jmp    1373 <createdelete+0x153>
    1361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1368:	83 fe 14             	cmp    $0x14,%esi
    136b:	74 6b                	je     13d8 <createdelete+0x1b8>
    136d:	83 c3 01             	add    $0x1,%ebx
    1370:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    1373:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1376:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1379:	68 02 02 00 00       	push   $0x202
    137e:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    137f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1382:	e8 9b 25 00 00       	call   3922 <open>
        if(fd < 0){
    1387:	83 c4 10             	add    $0x10,%esp
    138a:	85 c0                	test   %eax,%eax
    138c:	78 64                	js     13f2 <createdelete+0x1d2>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    138e:	83 ec 0c             	sub    $0xc,%esp
    1391:	50                   	push   %eax
    1392:	e8 73 25 00 00       	call   390a <close>
        if(i > 0 && (i % 2 ) == 0){
    1397:	83 c4 10             	add    $0x10,%esp
    139a:	85 db                	test   %ebx,%ebx
    139c:	74 cf                	je     136d <createdelete+0x14d>
    139e:	f6 c3 01             	test   $0x1,%bl
    13a1:	75 c5                	jne    1368 <createdelete+0x148>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    13a3:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    13a6:	89 d8                	mov    %ebx,%eax
    13a8:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    13aa:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    13ab:	83 c0 30             	add    $0x30,%eax
    13ae:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13b1:	e8 7c 25 00 00       	call   3932 <unlink>
    13b6:	83 c4 10             	add    $0x10,%esp
    13b9:	85 c0                	test   %eax,%eax
    13bb:	79 ab                	jns    1368 <createdelete+0x148>
            printf(1, "unlink failed\n");
    13bd:	83 ec 08             	sub    $0x8,%esp
    13c0:	68 09 3e 00 00       	push   $0x3e09
    13c5:	6a 01                	push   $0x1
    13c7:	e8 64 26 00 00       	call   3a30 <printf>
            exit();
    13cc:	e8 11 25 00 00       	call   38e2 <exit>
    13d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13d8:	e8 05 25 00 00       	call   38e2 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13dd:	83 ec 04             	sub    $0x4,%esp
    13e0:	57                   	push   %edi
    13e1:	68 a4 4e 00 00       	push   $0x4ea4
    13e6:	6a 01                	push   $0x1
    13e8:	e8 43 26 00 00       	call   3a30 <printf>
        exit();
    13ed:	e8 f0 24 00 00       	call   38e2 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13f2:	83 ec 08             	sub    $0x8,%esp
    13f5:	68 57 44 00 00       	push   $0x4457
    13fa:	6a 01                	push   $0x1
    13fc:	e8 2f 26 00 00       	call   3a30 <printf>
          exit();
    1401:	e8 dc 24 00 00       	call   38e2 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork(0);
    if(pid < 0){
      printf(1, "fork failed\n");
    1406:	83 ec 08             	sub    $0x8,%esp
    1409:	68 91 4c 00 00       	push   $0x4c91
    140e:	6a 01                	push   $0x1
    1410:	e8 1b 26 00 00       	call   3a30 <printf>
      exit();
    1415:	e8 c8 24 00 00       	call   38e2 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    141a:	85 c0                	test   %eax,%eax
    141c:	0f 88 c4 fe ff ff    	js     12e6 <createdelete+0xc6>
        printf(1, "oops createdelete %s did exist\n", name);
    1422:	83 ec 04             	sub    $0x4,%esp
    1425:	57                   	push   %edi
    1426:	68 c8 4e 00 00       	push   $0x4ec8
    142b:	6a 01                	push   $0x1
    142d:	e8 fe 25 00 00       	call   3a30 <printf>
        exit();
    1432:	e8 ab 24 00 00       	call   38e2 <exit>
    1437:	89 f6                	mov    %esi,%esi
    1439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001440 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	56                   	push   %esi
    1444:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1445:	83 ec 08             	sub    $0x8,%esp
    1448:	68 2c 42 00 00       	push   $0x422c
    144d:	6a 01                	push   $0x1
    144f:	e8 dc 25 00 00       	call   3a30 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1454:	5b                   	pop    %ebx
    1455:	5e                   	pop    %esi
    1456:	68 02 02 00 00       	push   $0x202
    145b:	68 3d 42 00 00       	push   $0x423d
    1460:	e8 bd 24 00 00       	call   3922 <open>
  if(fd < 0){
    1465:	83 c4 10             	add    $0x10,%esp
    1468:	85 c0                	test   %eax,%eax
    146a:	0f 88 e6 00 00 00    	js     1556 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	89 c3                	mov    %eax,%ebx
    1475:	6a 05                	push   $0x5
    1477:	68 62 42 00 00       	push   $0x4262
    147c:	50                   	push   %eax
    147d:	e8 80 24 00 00       	call   3902 <write>
  close(fd);
    1482:	89 1c 24             	mov    %ebx,(%esp)
    1485:	e8 80 24 00 00       	call   390a <close>

  fd = open("unlinkread", O_RDWR);
    148a:	58                   	pop    %eax
    148b:	5a                   	pop    %edx
    148c:	6a 02                	push   $0x2
    148e:	68 3d 42 00 00       	push   $0x423d
    1493:	e8 8a 24 00 00       	call   3922 <open>
  if(fd < 0){
    1498:	83 c4 10             	add    $0x10,%esp
    149b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    149d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    149f:	0f 88 10 01 00 00    	js     15b5 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    14a5:	83 ec 0c             	sub    $0xc,%esp
    14a8:	68 3d 42 00 00       	push   $0x423d
    14ad:	e8 80 24 00 00       	call   3932 <unlink>
    14b2:	83 c4 10             	add    $0x10,%esp
    14b5:	85 c0                	test   %eax,%eax
    14b7:	0f 85 e5 00 00 00    	jne    15a2 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14bd:	83 ec 08             	sub    $0x8,%esp
    14c0:	68 02 02 00 00       	push   $0x202
    14c5:	68 3d 42 00 00       	push   $0x423d
    14ca:	e8 53 24 00 00       	call   3922 <open>
  write(fd1, "yyy", 3);
    14cf:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14d2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14d4:	6a 03                	push   $0x3
    14d6:	68 9a 42 00 00       	push   $0x429a
    14db:	50                   	push   %eax
    14dc:	e8 21 24 00 00       	call   3902 <write>
  close(fd1);
    14e1:	89 34 24             	mov    %esi,(%esp)
    14e4:	e8 21 24 00 00       	call   390a <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14e9:	83 c4 0c             	add    $0xc,%esp
    14ec:	68 00 20 00 00       	push   $0x2000
    14f1:	68 80 85 00 00       	push   $0x8580
    14f6:	53                   	push   %ebx
    14f7:	e8 fe 23 00 00       	call   38fa <read>
    14fc:	83 c4 10             	add    $0x10,%esp
    14ff:	83 f8 05             	cmp    $0x5,%eax
    1502:	0f 85 87 00 00 00    	jne    158f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    1508:	80 3d 80 85 00 00 68 	cmpb   $0x68,0x8580
    150f:	75 6b                	jne    157c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    1511:	83 ec 04             	sub    $0x4,%esp
    1514:	6a 0a                	push   $0xa
    1516:	68 80 85 00 00       	push   $0x8580
    151b:	53                   	push   %ebx
    151c:	e8 e1 23 00 00       	call   3902 <write>
    1521:	83 c4 10             	add    $0x10,%esp
    1524:	83 f8 0a             	cmp    $0xa,%eax
    1527:	75 40                	jne    1569 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1529:	83 ec 0c             	sub    $0xc,%esp
    152c:	53                   	push   %ebx
    152d:	e8 d8 23 00 00       	call   390a <close>
  unlink("unlinkread");
    1532:	c7 04 24 3d 42 00 00 	movl   $0x423d,(%esp)
    1539:	e8 f4 23 00 00       	call   3932 <unlink>
  printf(1, "unlinkread ok\n");
    153e:	58                   	pop    %eax
    153f:	5a                   	pop    %edx
    1540:	68 e5 42 00 00       	push   $0x42e5
    1545:	6a 01                	push   $0x1
    1547:	e8 e4 24 00 00       	call   3a30 <printf>
}
    154c:	83 c4 10             	add    $0x10,%esp
    154f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1552:	5b                   	pop    %ebx
    1553:	5e                   	pop    %esi
    1554:	5d                   	pop    %ebp
    1555:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1556:	51                   	push   %ecx
    1557:	51                   	push   %ecx
    1558:	68 48 42 00 00       	push   $0x4248
    155d:	6a 01                	push   $0x1
    155f:	e8 cc 24 00 00       	call   3a30 <printf>
    exit();
    1564:	e8 79 23 00 00       	call   38e2 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1569:	51                   	push   %ecx
    156a:	51                   	push   %ecx
    156b:	68 cc 42 00 00       	push   $0x42cc
    1570:	6a 01                	push   $0x1
    1572:	e8 b9 24 00 00       	call   3a30 <printf>
    exit();
    1577:	e8 66 23 00 00       	call   38e2 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    157c:	53                   	push   %ebx
    157d:	53                   	push   %ebx
    157e:	68 b5 42 00 00       	push   $0x42b5
    1583:	6a 01                	push   $0x1
    1585:	e8 a6 24 00 00       	call   3a30 <printf>
    exit();
    158a:	e8 53 23 00 00       	call   38e2 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    158f:	56                   	push   %esi
    1590:	56                   	push   %esi
    1591:	68 9e 42 00 00       	push   $0x429e
    1596:	6a 01                	push   $0x1
    1598:	e8 93 24 00 00       	call   3a30 <printf>
    exit();
    159d:	e8 40 23 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    15a2:	50                   	push   %eax
    15a3:	50                   	push   %eax
    15a4:	68 80 42 00 00       	push   $0x4280
    15a9:	6a 01                	push   $0x1
    15ab:	e8 80 24 00 00       	call   3a30 <printf>
    exit();
    15b0:	e8 2d 23 00 00       	call   38e2 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    15b5:	50                   	push   %eax
    15b6:	50                   	push   %eax
    15b7:	68 68 42 00 00       	push   $0x4268
    15bc:	6a 01                	push   $0x1
    15be:	e8 6d 24 00 00       	call   3a30 <printf>
    exit();
    15c3:	e8 1a 23 00 00       	call   38e2 <exit>
    15c8:	90                   	nop
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015d0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	53                   	push   %ebx
    15d4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    15d7:	68 f4 42 00 00       	push   $0x42f4
    15dc:	6a 01                	push   $0x1
    15de:	e8 4d 24 00 00       	call   3a30 <printf>

  unlink("lf1");
    15e3:	c7 04 24 fe 42 00 00 	movl   $0x42fe,(%esp)
    15ea:	e8 43 23 00 00       	call   3932 <unlink>
  unlink("lf2");
    15ef:	c7 04 24 02 43 00 00 	movl   $0x4302,(%esp)
    15f6:	e8 37 23 00 00       	call   3932 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15fb:	58                   	pop    %eax
    15fc:	5a                   	pop    %edx
    15fd:	68 02 02 00 00       	push   $0x202
    1602:	68 fe 42 00 00       	push   $0x42fe
    1607:	e8 16 23 00 00       	call   3922 <open>
  if(fd < 0){
    160c:	83 c4 10             	add    $0x10,%esp
    160f:	85 c0                	test   %eax,%eax
    1611:	0f 88 1e 01 00 00    	js     1735 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    1617:	83 ec 04             	sub    $0x4,%esp
    161a:	89 c3                	mov    %eax,%ebx
    161c:	6a 05                	push   $0x5
    161e:	68 62 42 00 00       	push   $0x4262
    1623:	50                   	push   %eax
    1624:	e8 d9 22 00 00       	call   3902 <write>
    1629:	83 c4 10             	add    $0x10,%esp
    162c:	83 f8 05             	cmp    $0x5,%eax
    162f:	0f 85 98 01 00 00    	jne    17cd <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1635:	83 ec 0c             	sub    $0xc,%esp
    1638:	53                   	push   %ebx
    1639:	e8 cc 22 00 00       	call   390a <close>

  if(link("lf1", "lf2") < 0){
    163e:	5b                   	pop    %ebx
    163f:	58                   	pop    %eax
    1640:	68 02 43 00 00       	push   $0x4302
    1645:	68 fe 42 00 00       	push   $0x42fe
    164a:	e8 f3 22 00 00       	call   3942 <link>
    164f:	83 c4 10             	add    $0x10,%esp
    1652:	85 c0                	test   %eax,%eax
    1654:	0f 88 60 01 00 00    	js     17ba <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    165a:	83 ec 0c             	sub    $0xc,%esp
    165d:	68 fe 42 00 00       	push   $0x42fe
    1662:	e8 cb 22 00 00       	call   3932 <unlink>

  if(open("lf1", 0) >= 0){
    1667:	58                   	pop    %eax
    1668:	5a                   	pop    %edx
    1669:	6a 00                	push   $0x0
    166b:	68 fe 42 00 00       	push   $0x42fe
    1670:	e8 ad 22 00 00       	call   3922 <open>
    1675:	83 c4 10             	add    $0x10,%esp
    1678:	85 c0                	test   %eax,%eax
    167a:	0f 89 27 01 00 00    	jns    17a7 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1680:	83 ec 08             	sub    $0x8,%esp
    1683:	6a 00                	push   $0x0
    1685:	68 02 43 00 00       	push   $0x4302
    168a:	e8 93 22 00 00       	call   3922 <open>
  if(fd < 0){
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1694:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1696:	0f 88 f8 00 00 00    	js     1794 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    169c:	83 ec 04             	sub    $0x4,%esp
    169f:	68 00 20 00 00       	push   $0x2000
    16a4:	68 80 85 00 00       	push   $0x8580
    16a9:	50                   	push   %eax
    16aa:	e8 4b 22 00 00       	call   38fa <read>
    16af:	83 c4 10             	add    $0x10,%esp
    16b2:	83 f8 05             	cmp    $0x5,%eax
    16b5:	0f 85 c6 00 00 00    	jne    1781 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    16bb:	83 ec 0c             	sub    $0xc,%esp
    16be:	53                   	push   %ebx
    16bf:	e8 46 22 00 00       	call   390a <close>

  if(link("lf2", "lf2") >= 0){
    16c4:	58                   	pop    %eax
    16c5:	5a                   	pop    %edx
    16c6:	68 02 43 00 00       	push   $0x4302
    16cb:	68 02 43 00 00       	push   $0x4302
    16d0:	e8 6d 22 00 00       	call   3942 <link>
    16d5:	83 c4 10             	add    $0x10,%esp
    16d8:	85 c0                	test   %eax,%eax
    16da:	0f 89 8e 00 00 00    	jns    176e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16e0:	83 ec 0c             	sub    $0xc,%esp
    16e3:	68 02 43 00 00       	push   $0x4302
    16e8:	e8 45 22 00 00       	call   3932 <unlink>
  if(link("lf2", "lf1") >= 0){
    16ed:	59                   	pop    %ecx
    16ee:	5b                   	pop    %ebx
    16ef:	68 fe 42 00 00       	push   $0x42fe
    16f4:	68 02 43 00 00       	push   $0x4302
    16f9:	e8 44 22 00 00       	call   3942 <link>
    16fe:	83 c4 10             	add    $0x10,%esp
    1701:	85 c0                	test   %eax,%eax
    1703:	79 56                	jns    175b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    1705:	83 ec 08             	sub    $0x8,%esp
    1708:	68 fe 42 00 00       	push   $0x42fe
    170d:	68 c6 45 00 00       	push   $0x45c6
    1712:	e8 2b 22 00 00       	call   3942 <link>
    1717:	83 c4 10             	add    $0x10,%esp
    171a:	85 c0                	test   %eax,%eax
    171c:	79 2a                	jns    1748 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    171e:	83 ec 08             	sub    $0x8,%esp
    1721:	68 9c 43 00 00       	push   $0x439c
    1726:	6a 01                	push   $0x1
    1728:	e8 03 23 00 00       	call   3a30 <printf>
}
    172d:	83 c4 10             	add    $0x10,%esp
    1730:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1733:	c9                   	leave  
    1734:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1735:	50                   	push   %eax
    1736:	50                   	push   %eax
    1737:	68 06 43 00 00       	push   $0x4306
    173c:	6a 01                	push   $0x1
    173e:	e8 ed 22 00 00       	call   3a30 <printf>
    exit();
    1743:	e8 9a 21 00 00       	call   38e2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1748:	50                   	push   %eax
    1749:	50                   	push   %eax
    174a:	68 80 43 00 00       	push   $0x4380
    174f:	6a 01                	push   $0x1
    1751:	e8 da 22 00 00       	call   3a30 <printf>
    exit();
    1756:	e8 87 21 00 00       	call   38e2 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    175b:	52                   	push   %edx
    175c:	52                   	push   %edx
    175d:	68 10 4f 00 00       	push   $0x4f10
    1762:	6a 01                	push   $0x1
    1764:	e8 c7 22 00 00       	call   3a30 <printf>
    exit();
    1769:	e8 74 21 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    176e:	50                   	push   %eax
    176f:	50                   	push   %eax
    1770:	68 62 43 00 00       	push   $0x4362
    1775:	6a 01                	push   $0x1
    1777:	e8 b4 22 00 00       	call   3a30 <printf>
    exit();
    177c:	e8 61 21 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1781:	51                   	push   %ecx
    1782:	51                   	push   %ecx
    1783:	68 51 43 00 00       	push   $0x4351
    1788:	6a 01                	push   $0x1
    178a:	e8 a1 22 00 00       	call   3a30 <printf>
    exit();
    178f:	e8 4e 21 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1794:	53                   	push   %ebx
    1795:	53                   	push   %ebx
    1796:	68 40 43 00 00       	push   $0x4340
    179b:	6a 01                	push   $0x1
    179d:	e8 8e 22 00 00       	call   3a30 <printf>
    exit();
    17a2:	e8 3b 21 00 00       	call   38e2 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    17a7:	50                   	push   %eax
    17a8:	50                   	push   %eax
    17a9:	68 e8 4e 00 00       	push   $0x4ee8
    17ae:	6a 01                	push   $0x1
    17b0:	e8 7b 22 00 00       	call   3a30 <printf>
    exit();
    17b5:	e8 28 21 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    17ba:	51                   	push   %ecx
    17bb:	51                   	push   %ecx
    17bc:	68 2b 43 00 00       	push   $0x432b
    17c1:	6a 01                	push   $0x1
    17c3:	e8 68 22 00 00       	call   3a30 <printf>
    exit();
    17c8:	e8 15 21 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    17cd:	50                   	push   %eax
    17ce:	50                   	push   %eax
    17cf:	68 19 43 00 00       	push   $0x4319
    17d4:	6a 01                	push   $0x1
    17d6:	e8 55 22 00 00       	call   3a30 <printf>
    exit();
    17db:	e8 02 21 00 00       	call   38e2 <exit>

000017e0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	57                   	push   %edi
    17e4:	56                   	push   %esi
    17e5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17e6:	31 f6                	xor    %esi,%esi
    17e8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork(0);
    if(pid && (i % 3) == 1){
    17eb:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17f0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17f3:	68 a9 43 00 00       	push   $0x43a9
    17f8:	6a 01                	push   $0x1
    17fa:	e8 31 22 00 00       	call   3a30 <printf>
  file[0] = 'C';
    17ff:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1803:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1807:	83 c4 10             	add    $0x10,%esp
    180a:	eb 51                	jmp    185d <concreate+0x7d>
    180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork(0);
    if(pid && (i % 3) == 1){
    1810:	89 f0                	mov    %esi,%eax
    1812:	89 f1                	mov    %esi,%ecx
    1814:	f7 ef                	imul   %edi
    1816:	89 f0                	mov    %esi,%eax
    1818:	c1 f8 1f             	sar    $0x1f,%eax
    181b:	29 c2                	sub    %eax,%edx
    181d:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1820:	29 c1                	sub    %eax,%ecx
    1822:	83 f9 01             	cmp    $0x1,%ecx
    1825:	0f 84 c5 00 00 00    	je     18f0 <concreate+0x110>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    182b:	83 ec 08             	sub    $0x8,%esp
    182e:	68 02 02 00 00       	push   $0x202
    1833:	53                   	push   %ebx
    1834:	e8 e9 20 00 00       	call   3922 <open>
      if(fd < 0){
    1839:	83 c4 10             	add    $0x10,%esp
    183c:	85 c0                	test   %eax,%eax
    183e:	78 74                	js     18b4 <concreate+0xd4>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1840:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1843:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1846:	50                   	push   %eax
    1847:	e8 be 20 00 00       	call   390a <close>
    184c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    184f:	e8 96 20 00 00       	call   38ea <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1854:	83 fe 28             	cmp    $0x28,%esi
    1857:	0f 84 bb 00 00 00    	je     1918 <concreate+0x138>
    file[1] = '0' + i;
    unlink(file);
    185d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1860:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1863:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1864:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1867:	e8 c6 20 00 00       	call   3932 <unlink>
    pid = fork(0);
    186c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1873:	e8 62 20 00 00       	call   38da <fork>
    if(pid && (i % 3) == 1){
    1878:	83 c4 10             	add    $0x10,%esp
    187b:	85 c0                	test   %eax,%eax
    187d:	75 91                	jne    1810 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    187f:	89 f0                	mov    %esi,%eax
    1881:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1886:	f7 ea                	imul   %edx
    1888:	89 f0                	mov    %esi,%eax
    188a:	c1 f8 1f             	sar    $0x1f,%eax
    188d:	d1 fa                	sar    %edx
    188f:	29 c2                	sub    %eax,%edx
    1891:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1894:	29 c6                	sub    %eax,%esi
    1896:	83 fe 01             	cmp    $0x1,%esi
    1899:	74 35                	je     18d0 <concreate+0xf0>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    189b:	83 ec 08             	sub    $0x8,%esp
    189e:	68 02 02 00 00       	push   $0x202
    18a3:	53                   	push   %ebx
    18a4:	e8 79 20 00 00       	call   3922 <open>
      if(fd < 0){
    18a9:	83 c4 10             	add    $0x10,%esp
    18ac:	85 c0                	test   %eax,%eax
    18ae:	0f 89 4b 02 00 00    	jns    1aff <concreate+0x31f>
        printf(1, "concreate create %s failed\n", file);
    18b4:	83 ec 04             	sub    $0x4,%esp
    18b7:	53                   	push   %ebx
    18b8:	68 bc 43 00 00       	push   $0x43bc
    18bd:	6a 01                	push   $0x1
    18bf:	e8 6c 21 00 00       	call   3a30 <printf>
        exit();
    18c4:	e8 19 20 00 00       	call   38e2 <exit>
    18c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    unlink(file);
    pid = fork(0);
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    18d0:	83 ec 08             	sub    $0x8,%esp
    18d3:	53                   	push   %ebx
    18d4:	68 b9 43 00 00       	push   $0x43b9
    18d9:	e8 64 20 00 00       	call   3942 <link>
    18de:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    18e1:	e8 fc 1f 00 00       	call   38e2 <exit>
    18e6:	8d 76 00             	lea    0x0(%esi),%esi
    18e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork(0);
    if(pid && (i % 3) == 1){
      link("C0", file);
    18f0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18f3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork(0);
    if(pid && (i % 3) == 1){
      link("C0", file);
    18f6:	53                   	push   %ebx
    18f7:	68 b9 43 00 00       	push   $0x43b9
    18fc:	e8 41 20 00 00       	call   3942 <link>
    1901:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1904:	e8 e1 1f 00 00       	call   38ea <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1909:	83 fe 28             	cmp    $0x28,%esi
    190c:	0f 85 4b ff ff ff    	jne    185d <concreate+0x7d>
    1912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1918:	8d 45 c0             	lea    -0x40(%ebp),%eax
    191b:	83 ec 04             	sub    $0x4,%esp
    191e:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1921:	6a 28                	push   $0x28
    1923:	6a 00                	push   $0x0
    1925:	50                   	push   %eax
    1926:	e8 25 1e 00 00       	call   3750 <memset>
  fd = open(".", 0);
    192b:	59                   	pop    %ecx
    192c:	5e                   	pop    %esi
    192d:	6a 00                	push   $0x0
    192f:	68 c6 45 00 00       	push   $0x45c6
    1934:	e8 e9 1f 00 00       	call   3922 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1939:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    193c:	89 c6                	mov    %eax,%esi
  n = 0;
    193e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1945:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1948:	83 ec 04             	sub    $0x4,%esp
    194b:	6a 10                	push   $0x10
    194d:	57                   	push   %edi
    194e:	56                   	push   %esi
    194f:	e8 a6 1f 00 00       	call   38fa <read>
    1954:	83 c4 10             	add    $0x10,%esp
    1957:	85 c0                	test   %eax,%eax
    1959:	7e 3d                	jle    1998 <concreate+0x1b8>
    if(de.inum == 0)
    195b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1960:	74 e6                	je     1948 <concreate+0x168>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1962:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1966:	75 e0                	jne    1948 <concreate+0x168>
    1968:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    196c:	75 da                	jne    1948 <concreate+0x168>
      i = de.name[1] - '0';
    196e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1972:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1975:	83 f8 27             	cmp    $0x27,%eax
    1978:	0f 87 69 01 00 00    	ja     1ae7 <concreate+0x307>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    197e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1983:	0f 85 46 01 00 00    	jne    1acf <concreate+0x2ef>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1989:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    198e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1992:	eb b4                	jmp    1948 <concreate+0x168>
    1994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1998:	83 ec 0c             	sub    $0xc,%esp
    199b:	56                   	push   %esi
    199c:	e8 69 1f 00 00       	call   390a <close>

  if(n != 40){
    19a1:	83 c4 10             	add    $0x10,%esp
    19a4:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    19a8:	0f 85 0d 01 00 00    	jne    1abb <concreate+0x2db>
    19ae:	31 f6                	xor    %esi,%esi
    19b0:	eb 70                	jmp    1a22 <concreate+0x242>
    19b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    19b8:	83 fa 01             	cmp    $0x1,%edx
    19bb:	0f 85 a1 00 00 00    	jne    1a62 <concreate+0x282>
      close(open(file, 0));
    19c1:	83 ec 08             	sub    $0x8,%esp
    19c4:	6a 00                	push   $0x0
    19c6:	53                   	push   %ebx
    19c7:	e8 56 1f 00 00       	call   3922 <open>
    19cc:	89 04 24             	mov    %eax,(%esp)
    19cf:	e8 36 1f 00 00       	call   390a <close>
      close(open(file, 0));
    19d4:	58                   	pop    %eax
    19d5:	5a                   	pop    %edx
    19d6:	6a 00                	push   $0x0
    19d8:	53                   	push   %ebx
    19d9:	e8 44 1f 00 00       	call   3922 <open>
    19de:	89 04 24             	mov    %eax,(%esp)
    19e1:	e8 24 1f 00 00       	call   390a <close>
      close(open(file, 0));
    19e6:	59                   	pop    %ecx
    19e7:	58                   	pop    %eax
    19e8:	6a 00                	push   $0x0
    19ea:	53                   	push   %ebx
    19eb:	e8 32 1f 00 00       	call   3922 <open>
    19f0:	89 04 24             	mov    %eax,(%esp)
    19f3:	e8 12 1f 00 00       	call   390a <close>
      close(open(file, 0));
    19f8:	58                   	pop    %eax
    19f9:	5a                   	pop    %edx
    19fa:	6a 00                	push   $0x0
    19fc:	53                   	push   %ebx
    19fd:	e8 20 1f 00 00       	call   3922 <open>
    1a02:	89 04 24             	mov    %eax,(%esp)
    1a05:	e8 00 1f 00 00       	call   390a <close>
    1a0a:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1a0d:	85 ff                	test   %edi,%edi
    1a0f:	0f 84 cc fe ff ff    	je     18e1 <concreate+0x101>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1a15:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1a18:	e8 cd 1e 00 00       	call   38ea <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1a1d:	83 fe 28             	cmp    $0x28,%esi
    1a20:	74 6e                	je     1a90 <concreate+0x2b0>
    file[1] = '0' + i;
    pid = fork(0);
    1a22:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1a25:	8d 46 30             	lea    0x30(%esi),%eax
    pid = fork(0);
    1a28:	6a 00                	push   $0x0
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1a2a:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork(0);
    1a2d:	e8 a8 1e 00 00       	call   38da <fork>
    if(pid < 0){
    1a32:	83 c4 10             	add    $0x10,%esp
    1a35:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork(0);
    1a37:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a39:	78 6c                	js     1aa7 <concreate+0x2c7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1a3b:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1a40:	f7 ee                	imul   %esi
    1a42:	89 f0                	mov    %esi,%eax
    1a44:	c1 f8 1f             	sar    $0x1f,%eax
    1a47:	29 c2                	sub    %eax,%edx
    1a49:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a4c:	89 f2                	mov    %esi,%edx
    1a4e:	29 c2                	sub    %eax,%edx
    1a50:	89 f8                	mov    %edi,%eax
    1a52:	09 d0                	or     %edx,%eax
    1a54:	0f 84 67 ff ff ff    	je     19c1 <concreate+0x1e1>
       ((i % 3) == 1 && pid != 0)){
    1a5a:	85 ff                	test   %edi,%edi
    1a5c:	0f 85 56 ff ff ff    	jne    19b8 <concreate+0x1d8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a62:	83 ec 0c             	sub    $0xc,%esp
    1a65:	53                   	push   %ebx
    1a66:	e8 c7 1e 00 00       	call   3932 <unlink>
      unlink(file);
    1a6b:	89 1c 24             	mov    %ebx,(%esp)
    1a6e:	e8 bf 1e 00 00       	call   3932 <unlink>
      unlink(file);
    1a73:	89 1c 24             	mov    %ebx,(%esp)
    1a76:	e8 b7 1e 00 00       	call   3932 <unlink>
      unlink(file);
    1a7b:	89 1c 24             	mov    %ebx,(%esp)
    1a7e:	e8 af 1e 00 00       	call   3932 <unlink>
    1a83:	83 c4 10             	add    $0x10,%esp
    1a86:	eb 85                	jmp    1a0d <concreate+0x22d>
    1a88:	90                   	nop
    1a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a90:	83 ec 08             	sub    $0x8,%esp
    1a93:	68 0e 44 00 00       	push   $0x440e
    1a98:	6a 01                	push   $0x1
    1a9a:	e8 91 1f 00 00       	call   3a30 <printf>
}
    1a9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1aa2:	5b                   	pop    %ebx
    1aa3:	5e                   	pop    %esi
    1aa4:	5f                   	pop    %edi
    1aa5:	5d                   	pop    %ebp
    1aa6:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork(0);
    if(pid < 0){
      printf(1, "fork failed\n");
    1aa7:	83 ec 08             	sub    $0x8,%esp
    1aaa:	68 91 4c 00 00       	push   $0x4c91
    1aaf:	6a 01                	push   $0x1
    1ab1:	e8 7a 1f 00 00       	call   3a30 <printf>
      exit();
    1ab6:	e8 27 1e 00 00       	call   38e2 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1abb:	83 ec 08             	sub    $0x8,%esp
    1abe:	68 34 4f 00 00       	push   $0x4f34
    1ac3:	6a 01                	push   $0x1
    1ac5:	e8 66 1f 00 00       	call   3a30 <printf>
    exit();
    1aca:	e8 13 1e 00 00       	call   38e2 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1acf:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ad2:	83 ec 04             	sub    $0x4,%esp
    1ad5:	50                   	push   %eax
    1ad6:	68 f1 43 00 00       	push   $0x43f1
    1adb:	6a 01                	push   $0x1
    1add:	e8 4e 1f 00 00       	call   3a30 <printf>
        exit();
    1ae2:	e8 fb 1d 00 00       	call   38e2 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1ae7:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aea:	83 ec 04             	sub    $0x4,%esp
    1aed:	50                   	push   %eax
    1aee:	68 d8 43 00 00       	push   $0x43d8
    1af3:	6a 01                	push   $0x1
    1af5:	e8 36 1f 00 00       	call   3a30 <printf>
        exit();
    1afa:	e8 e3 1d 00 00       	call   38e2 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1aff:	83 ec 0c             	sub    $0xc,%esp
    1b02:	50                   	push   %eax
    1b03:	e8 02 1e 00 00       	call   390a <close>
    1b08:	83 c4 10             	add    $0x10,%esp
    1b0b:	e9 d1 fd ff ff       	jmp    18e1 <concreate+0x101>

00001b10 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1b10:	55                   	push   %ebp
    1b11:	89 e5                	mov    %esp,%ebp
    1b13:	57                   	push   %edi
    1b14:	56                   	push   %esi
    1b15:	53                   	push   %ebx
    1b16:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1b19:	68 1c 44 00 00       	push   $0x441c
    1b1e:	6a 01                	push   $0x1
    1b20:	e8 0b 1f 00 00       	call   3a30 <printf>

  unlink("x");
    1b25:	c7 04 24 a9 46 00 00 	movl   $0x46a9,(%esp)
    1b2c:	e8 01 1e 00 00       	call   3932 <unlink>
  pid = fork(0);
    1b31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b38:	e8 9d 1d 00 00       	call   38da <fork>
  if(pid < 0){
    1b3d:	83 c4 10             	add    $0x10,%esp
    1b40:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork(0);
    1b42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b45:	0f 88 b7 00 00 00    	js     1c02 <linkunlink+0xf2>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b4b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b4f:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1b54:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b59:	19 ff                	sbb    %edi,%edi
    1b5b:	83 e7 60             	and    $0x60,%edi
    1b5e:	83 c7 01             	add    $0x1,%edi
    1b61:	eb 1f                	jmp    1b82 <linkunlink+0x72>
    1b63:	90                   	nop
    1b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b68:	83 fa 01             	cmp    $0x1,%edx
    1b6b:	74 7b                	je     1be8 <linkunlink+0xd8>
      link("cat", "x");
    } else {
      unlink("x");
    1b6d:	83 ec 0c             	sub    $0xc,%esp
    1b70:	68 a9 46 00 00       	push   $0x46a9
    1b75:	e8 b8 1d 00 00       	call   3932 <unlink>
    1b7a:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b7d:	83 eb 01             	sub    $0x1,%ebx
    1b80:	74 3d                	je     1bbf <linkunlink+0xaf>
    x = x * 1103515245 + 12345;
    1b82:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b88:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b8e:	89 f8                	mov    %edi,%eax
    1b90:	f7 e6                	mul    %esi
    1b92:	d1 ea                	shr    %edx
    1b94:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b97:	89 fa                	mov    %edi,%edx
    1b99:	29 c2                	sub    %eax,%edx
    1b9b:	75 cb                	jne    1b68 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    1b9d:	83 ec 08             	sub    $0x8,%esp
    1ba0:	68 02 02 00 00       	push   $0x202
    1ba5:	68 a9 46 00 00       	push   $0x46a9
    1baa:	e8 73 1d 00 00       	call   3922 <open>
    1baf:	89 04 24             	mov    %eax,(%esp)
    1bb2:	e8 53 1d 00 00       	call   390a <close>
    1bb7:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1bba:	83 eb 01             	sub    $0x1,%ebx
    1bbd:	75 c3                	jne    1b82 <linkunlink+0x72>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1bbf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bc2:	85 c0                	test   %eax,%eax
    1bc4:	74 50                	je     1c16 <linkunlink+0x106>
    wait();
    1bc6:	e8 1f 1d 00 00       	call   38ea <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1bcb:	83 ec 08             	sub    $0x8,%esp
    1bce:	68 31 44 00 00       	push   $0x4431
    1bd3:	6a 01                	push   $0x1
    1bd5:	e8 56 1e 00 00       	call   3a30 <printf>
}
    1bda:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1bdd:	5b                   	pop    %ebx
    1bde:	5e                   	pop    %esi
    1bdf:	5f                   	pop    %edi
    1be0:	5d                   	pop    %ebp
    1be1:	c3                   	ret    
    1be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1be8:	83 ec 08             	sub    $0x8,%esp
    1beb:	68 a9 46 00 00       	push   $0x46a9
    1bf0:	68 2d 44 00 00       	push   $0x442d
    1bf5:	e8 48 1d 00 00       	call   3942 <link>
    1bfa:	83 c4 10             	add    $0x10,%esp
    1bfd:	e9 7b ff ff ff       	jmp    1b7d <linkunlink+0x6d>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork(0);
  if(pid < 0){
    printf(1, "fork failed\n");
    1c02:	83 ec 08             	sub    $0x8,%esp
    1c05:	68 91 4c 00 00       	push   $0x4c91
    1c0a:	6a 01                	push   $0x1
    1c0c:	e8 1f 1e 00 00       	call   3a30 <printf>
    exit();
    1c11:	e8 cc 1c 00 00       	call   38e2 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1c16:	e8 c7 1c 00 00       	call   38e2 <exit>
    1c1b:	90                   	nop
    1c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c20 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1c20:	55                   	push   %ebp
    1c21:	89 e5                	mov    %esp,%ebp
    1c23:	56                   	push   %esi
    1c24:	53                   	push   %ebx
    1c25:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1c28:	68 40 44 00 00       	push   $0x4440
    1c2d:	6a 01                	push   $0x1
    1c2f:	e8 fc 1d 00 00       	call   3a30 <printf>
  unlink("bd");
    1c34:	c7 04 24 4d 44 00 00 	movl   $0x444d,(%esp)
    1c3b:	e8 f2 1c 00 00       	call   3932 <unlink>

  fd = open("bd", O_CREATE);
    1c40:	58                   	pop    %eax
    1c41:	5a                   	pop    %edx
    1c42:	68 00 02 00 00       	push   $0x200
    1c47:	68 4d 44 00 00       	push   $0x444d
    1c4c:	e8 d1 1c 00 00       	call   3922 <open>
  if(fd < 0){
    1c51:	83 c4 10             	add    $0x10,%esp
    1c54:	85 c0                	test   %eax,%eax
    1c56:	0f 88 de 00 00 00    	js     1d3a <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c5c:	83 ec 0c             	sub    $0xc,%esp
    1c5f:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1c62:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c64:	50                   	push   %eax
    1c65:	e8 a0 1c 00 00       	call   390a <close>
    1c6a:	83 c4 10             	add    $0x10,%esp
    1c6d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c70:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c72:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c75:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c79:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c7c:	56                   	push   %esi
    1c7d:	68 4d 44 00 00       	push   $0x444d
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c82:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c85:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c89:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c8c:	89 d8                	mov    %ebx,%eax
    1c8e:	83 e0 3f             	and    $0x3f,%eax
    1c91:	83 c0 30             	add    $0x30,%eax
    1c94:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c97:	e8 a6 1c 00 00       	call   3942 <link>
    1c9c:	83 c4 10             	add    $0x10,%esp
    1c9f:	85 c0                	test   %eax,%eax
    1ca1:	75 6f                	jne    1d12 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1ca3:	83 c3 01             	add    $0x1,%ebx
    1ca6:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cac:	75 c2                	jne    1c70 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1cae:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1cb1:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1cb3:	68 4d 44 00 00       	push   $0x444d
    1cb8:	e8 75 1c 00 00       	call   3932 <unlink>
    1cbd:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1cc0:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1cc2:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1cc5:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1cc9:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1ccc:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1ccd:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1cd1:	83 c0 30             	add    $0x30,%eax
    1cd4:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1cd7:	89 d8                	mov    %ebx,%eax
    1cd9:	83 e0 3f             	and    $0x3f,%eax
    1cdc:	83 c0 30             	add    $0x30,%eax
    1cdf:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1ce2:	e8 4b 1c 00 00       	call   3932 <unlink>
    1ce7:	83 c4 10             	add    $0x10,%esp
    1cea:	85 c0                	test   %eax,%eax
    1cec:	75 38                	jne    1d26 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cee:	83 c3 01             	add    $0x1,%ebx
    1cf1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cf7:	75 c7                	jne    1cc0 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cf9:	83 ec 08             	sub    $0x8,%esp
    1cfc:	68 8f 44 00 00       	push   $0x448f
    1d01:	6a 01                	push   $0x1
    1d03:	e8 28 1d 00 00       	call   3a30 <printf>
}
    1d08:	83 c4 10             	add    $0x10,%esp
    1d0b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d0e:	5b                   	pop    %ebx
    1d0f:	5e                   	pop    %esi
    1d10:	5d                   	pop    %ebp
    1d11:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1d12:	83 ec 08             	sub    $0x8,%esp
    1d15:	68 66 44 00 00       	push   $0x4466
    1d1a:	6a 01                	push   $0x1
    1d1c:	e8 0f 1d 00 00       	call   3a30 <printf>
      exit();
    1d21:	e8 bc 1b 00 00       	call   38e2 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1d26:	83 ec 08             	sub    $0x8,%esp
    1d29:	68 7a 44 00 00       	push   $0x447a
    1d2e:	6a 01                	push   $0x1
    1d30:	e8 fb 1c 00 00       	call   3a30 <printf>
      exit();
    1d35:	e8 a8 1b 00 00       	call   38e2 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1d3a:	83 ec 08             	sub    $0x8,%esp
    1d3d:	68 50 44 00 00       	push   $0x4450
    1d42:	6a 01                	push   $0x1
    1d44:	e8 e7 1c 00 00       	call   3a30 <printf>
    exit();
    1d49:	e8 94 1b 00 00       	call   38e2 <exit>
    1d4e:	66 90                	xchg   %ax,%ax

00001d50 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1d50:	55                   	push   %ebp
    1d51:	89 e5                	mov    %esp,%ebp
    1d53:	53                   	push   %ebx
    1d54:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1d57:	68 9a 44 00 00       	push   $0x449a
    1d5c:	6a 01                	push   $0x1
    1d5e:	e8 cd 1c 00 00       	call   3a30 <printf>

  unlink("ff");
    1d63:	c7 04 24 23 45 00 00 	movl   $0x4523,(%esp)
    1d6a:	e8 c3 1b 00 00       	call   3932 <unlink>
  if(mkdir("dd") != 0){
    1d6f:	c7 04 24 c0 45 00 00 	movl   $0x45c0,(%esp)
    1d76:	e8 cf 1b 00 00       	call   394a <mkdir>
    1d7b:	83 c4 10             	add    $0x10,%esp
    1d7e:	85 c0                	test   %eax,%eax
    1d80:	0f 85 b3 05 00 00    	jne    2339 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d86:	83 ec 08             	sub    $0x8,%esp
    1d89:	68 02 02 00 00       	push   $0x202
    1d8e:	68 f9 44 00 00       	push   $0x44f9
    1d93:	e8 8a 1b 00 00       	call   3922 <open>
  if(fd < 0){
    1d98:	83 c4 10             	add    $0x10,%esp
    1d9b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d9d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d9f:	0f 88 81 05 00 00    	js     2326 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1da5:	83 ec 04             	sub    $0x4,%esp
    1da8:	6a 02                	push   $0x2
    1daa:	68 23 45 00 00       	push   $0x4523
    1daf:	50                   	push   %eax
    1db0:	e8 4d 1b 00 00       	call   3902 <write>
  close(fd);
    1db5:	89 1c 24             	mov    %ebx,(%esp)
    1db8:	e8 4d 1b 00 00       	call   390a <close>

  if(unlink("dd") >= 0){
    1dbd:	c7 04 24 c0 45 00 00 	movl   $0x45c0,(%esp)
    1dc4:	e8 69 1b 00 00       	call   3932 <unlink>
    1dc9:	83 c4 10             	add    $0x10,%esp
    1dcc:	85 c0                	test   %eax,%eax
    1dce:	0f 89 3f 05 00 00    	jns    2313 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1dd4:	83 ec 0c             	sub    $0xc,%esp
    1dd7:	68 d4 44 00 00       	push   $0x44d4
    1ddc:	e8 69 1b 00 00       	call   394a <mkdir>
    1de1:	83 c4 10             	add    $0x10,%esp
    1de4:	85 c0                	test   %eax,%eax
    1de6:	0f 85 14 05 00 00    	jne    2300 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dec:	83 ec 08             	sub    $0x8,%esp
    1def:	68 02 02 00 00       	push   $0x202
    1df4:	68 f6 44 00 00       	push   $0x44f6
    1df9:	e8 24 1b 00 00       	call   3922 <open>
  if(fd < 0){
    1dfe:	83 c4 10             	add    $0x10,%esp
    1e01:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e03:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e05:	0f 88 24 04 00 00    	js     222f <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1e0b:	83 ec 04             	sub    $0x4,%esp
    1e0e:	6a 02                	push   $0x2
    1e10:	68 17 45 00 00       	push   $0x4517
    1e15:	50                   	push   %eax
    1e16:	e8 e7 1a 00 00       	call   3902 <write>
  close(fd);
    1e1b:	89 1c 24             	mov    %ebx,(%esp)
    1e1e:	e8 e7 1a 00 00       	call   390a <close>

  fd = open("dd/dd/../ff", 0);
    1e23:	58                   	pop    %eax
    1e24:	5a                   	pop    %edx
    1e25:	6a 00                	push   $0x0
    1e27:	68 1a 45 00 00       	push   $0x451a
    1e2c:	e8 f1 1a 00 00       	call   3922 <open>
  if(fd < 0){
    1e31:	83 c4 10             	add    $0x10,%esp
    1e34:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1e36:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e38:	0f 88 de 03 00 00    	js     221c <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1e3e:	83 ec 04             	sub    $0x4,%esp
    1e41:	68 00 20 00 00       	push   $0x2000
    1e46:	68 80 85 00 00       	push   $0x8580
    1e4b:	50                   	push   %eax
    1e4c:	e8 a9 1a 00 00       	call   38fa <read>
  if(cc != 2 || buf[0] != 'f'){
    1e51:	83 c4 10             	add    $0x10,%esp
    1e54:	83 f8 02             	cmp    $0x2,%eax
    1e57:	0f 85 3a 03 00 00    	jne    2197 <subdir+0x447>
    1e5d:	80 3d 80 85 00 00 66 	cmpb   $0x66,0x8580
    1e64:	0f 85 2d 03 00 00    	jne    2197 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e6a:	83 ec 0c             	sub    $0xc,%esp
    1e6d:	53                   	push   %ebx
    1e6e:	e8 97 1a 00 00       	call   390a <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e73:	5b                   	pop    %ebx
    1e74:	58                   	pop    %eax
    1e75:	68 5a 45 00 00       	push   $0x455a
    1e7a:	68 f6 44 00 00       	push   $0x44f6
    1e7f:	e8 be 1a 00 00       	call   3942 <link>
    1e84:	83 c4 10             	add    $0x10,%esp
    1e87:	85 c0                	test   %eax,%eax
    1e89:	0f 85 c6 03 00 00    	jne    2255 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e8f:	83 ec 0c             	sub    $0xc,%esp
    1e92:	68 f6 44 00 00       	push   $0x44f6
    1e97:	e8 96 1a 00 00       	call   3932 <unlink>
    1e9c:	83 c4 10             	add    $0x10,%esp
    1e9f:	85 c0                	test   %eax,%eax
    1ea1:	0f 85 16 03 00 00    	jne    21bd <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ea7:	83 ec 08             	sub    $0x8,%esp
    1eaa:	6a 00                	push   $0x0
    1eac:	68 f6 44 00 00       	push   $0x44f6
    1eb1:	e8 6c 1a 00 00       	call   3922 <open>
    1eb6:	83 c4 10             	add    $0x10,%esp
    1eb9:	85 c0                	test   %eax,%eax
    1ebb:	0f 89 2c 04 00 00    	jns    22ed <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1ec1:	83 ec 0c             	sub    $0xc,%esp
    1ec4:	68 c0 45 00 00       	push   $0x45c0
    1ec9:	e8 84 1a 00 00       	call   3952 <chdir>
    1ece:	83 c4 10             	add    $0x10,%esp
    1ed1:	85 c0                	test   %eax,%eax
    1ed3:	0f 85 01 04 00 00    	jne    22da <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1ed9:	83 ec 0c             	sub    $0xc,%esp
    1edc:	68 8e 45 00 00       	push   $0x458e
    1ee1:	e8 6c 1a 00 00       	call   3952 <chdir>
    1ee6:	83 c4 10             	add    $0x10,%esp
    1ee9:	85 c0                	test   %eax,%eax
    1eeb:	0f 85 b9 02 00 00    	jne    21aa <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1ef1:	83 ec 0c             	sub    $0xc,%esp
    1ef4:	68 b4 45 00 00       	push   $0x45b4
    1ef9:	e8 54 1a 00 00       	call   3952 <chdir>
    1efe:	83 c4 10             	add    $0x10,%esp
    1f01:	85 c0                	test   %eax,%eax
    1f03:	0f 85 a1 02 00 00    	jne    21aa <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1f09:	83 ec 0c             	sub    $0xc,%esp
    1f0c:	68 c3 45 00 00       	push   $0x45c3
    1f11:	e8 3c 1a 00 00       	call   3952 <chdir>
    1f16:	83 c4 10             	add    $0x10,%esp
    1f19:	85 c0                	test   %eax,%eax
    1f1b:	0f 85 21 03 00 00    	jne    2242 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1f21:	83 ec 08             	sub    $0x8,%esp
    1f24:	6a 00                	push   $0x0
    1f26:	68 5a 45 00 00       	push   $0x455a
    1f2b:	e8 f2 19 00 00       	call   3922 <open>
  if(fd < 0){
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1f35:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f37:	0f 88 e0 04 00 00    	js     241d <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1f3d:	83 ec 04             	sub    $0x4,%esp
    1f40:	68 00 20 00 00       	push   $0x2000
    1f45:	68 80 85 00 00       	push   $0x8580
    1f4a:	50                   	push   %eax
    1f4b:	e8 aa 19 00 00       	call   38fa <read>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	83 f8 02             	cmp    $0x2,%eax
    1f56:	0f 85 ae 04 00 00    	jne    240a <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1f5c:	83 ec 0c             	sub    $0xc,%esp
    1f5f:	53                   	push   %ebx
    1f60:	e8 a5 19 00 00       	call   390a <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f65:	59                   	pop    %ecx
    1f66:	5b                   	pop    %ebx
    1f67:	6a 00                	push   $0x0
    1f69:	68 f6 44 00 00       	push   $0x44f6
    1f6e:	e8 af 19 00 00       	call   3922 <open>
    1f73:	83 c4 10             	add    $0x10,%esp
    1f76:	85 c0                	test   %eax,%eax
    1f78:	0f 89 65 02 00 00    	jns    21e3 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f7e:	83 ec 08             	sub    $0x8,%esp
    1f81:	68 02 02 00 00       	push   $0x202
    1f86:	68 0e 46 00 00       	push   $0x460e
    1f8b:	e8 92 19 00 00       	call   3922 <open>
    1f90:	83 c4 10             	add    $0x10,%esp
    1f93:	85 c0                	test   %eax,%eax
    1f95:	0f 89 35 02 00 00    	jns    21d0 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f9b:	83 ec 08             	sub    $0x8,%esp
    1f9e:	68 02 02 00 00       	push   $0x202
    1fa3:	68 33 46 00 00       	push   $0x4633
    1fa8:	e8 75 19 00 00       	call   3922 <open>
    1fad:	83 c4 10             	add    $0x10,%esp
    1fb0:	85 c0                	test   %eax,%eax
    1fb2:	0f 89 0f 03 00 00    	jns    22c7 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1fb8:	83 ec 08             	sub    $0x8,%esp
    1fbb:	68 00 02 00 00       	push   $0x200
    1fc0:	68 c0 45 00 00       	push   $0x45c0
    1fc5:	e8 58 19 00 00       	call   3922 <open>
    1fca:	83 c4 10             	add    $0x10,%esp
    1fcd:	85 c0                	test   %eax,%eax
    1fcf:	0f 89 df 02 00 00    	jns    22b4 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1fd5:	83 ec 08             	sub    $0x8,%esp
    1fd8:	6a 02                	push   $0x2
    1fda:	68 c0 45 00 00       	push   $0x45c0
    1fdf:	e8 3e 19 00 00       	call   3922 <open>
    1fe4:	83 c4 10             	add    $0x10,%esp
    1fe7:	85 c0                	test   %eax,%eax
    1fe9:	0f 89 b2 02 00 00    	jns    22a1 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1fef:	83 ec 08             	sub    $0x8,%esp
    1ff2:	6a 01                	push   $0x1
    1ff4:	68 c0 45 00 00       	push   $0x45c0
    1ff9:	e8 24 19 00 00       	call   3922 <open>
    1ffe:	83 c4 10             	add    $0x10,%esp
    2001:	85 c0                	test   %eax,%eax
    2003:	0f 89 85 02 00 00    	jns    228e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2009:	83 ec 08             	sub    $0x8,%esp
    200c:	68 a2 46 00 00       	push   $0x46a2
    2011:	68 0e 46 00 00       	push   $0x460e
    2016:	e8 27 19 00 00       	call   3942 <link>
    201b:	83 c4 10             	add    $0x10,%esp
    201e:	85 c0                	test   %eax,%eax
    2020:	0f 84 55 02 00 00    	je     227b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2026:	83 ec 08             	sub    $0x8,%esp
    2029:	68 a2 46 00 00       	push   $0x46a2
    202e:	68 33 46 00 00       	push   $0x4633
    2033:	e8 0a 19 00 00       	call   3942 <link>
    2038:	83 c4 10             	add    $0x10,%esp
    203b:	85 c0                	test   %eax,%eax
    203d:	0f 84 25 02 00 00    	je     2268 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2043:	83 ec 08             	sub    $0x8,%esp
    2046:	68 5a 45 00 00       	push   $0x455a
    204b:	68 f9 44 00 00       	push   $0x44f9
    2050:	e8 ed 18 00 00       	call   3942 <link>
    2055:	83 c4 10             	add    $0x10,%esp
    2058:	85 c0                	test   %eax,%eax
    205a:	0f 84 a9 01 00 00    	je     2209 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2060:	83 ec 0c             	sub    $0xc,%esp
    2063:	68 0e 46 00 00       	push   $0x460e
    2068:	e8 dd 18 00 00       	call   394a <mkdir>
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	85 c0                	test   %eax,%eax
    2072:	0f 84 7e 01 00 00    	je     21f6 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2078:	83 ec 0c             	sub    $0xc,%esp
    207b:	68 33 46 00 00       	push   $0x4633
    2080:	e8 c5 18 00 00       	call   394a <mkdir>
    2085:	83 c4 10             	add    $0x10,%esp
    2088:	85 c0                	test   %eax,%eax
    208a:	0f 84 67 03 00 00    	je     23f7 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2090:	83 ec 0c             	sub    $0xc,%esp
    2093:	68 5a 45 00 00       	push   $0x455a
    2098:	e8 ad 18 00 00       	call   394a <mkdir>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	85 c0                	test   %eax,%eax
    20a2:	0f 84 3c 03 00 00    	je     23e4 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    20a8:	83 ec 0c             	sub    $0xc,%esp
    20ab:	68 33 46 00 00       	push   $0x4633
    20b0:	e8 7d 18 00 00       	call   3932 <unlink>
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	85 c0                	test   %eax,%eax
    20ba:	0f 84 11 03 00 00    	je     23d1 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    20c0:	83 ec 0c             	sub    $0xc,%esp
    20c3:	68 0e 46 00 00       	push   $0x460e
    20c8:	e8 65 18 00 00       	call   3932 <unlink>
    20cd:	83 c4 10             	add    $0x10,%esp
    20d0:	85 c0                	test   %eax,%eax
    20d2:	0f 84 e6 02 00 00    	je     23be <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    20d8:	83 ec 0c             	sub    $0xc,%esp
    20db:	68 f9 44 00 00       	push   $0x44f9
    20e0:	e8 6d 18 00 00       	call   3952 <chdir>
    20e5:	83 c4 10             	add    $0x10,%esp
    20e8:	85 c0                	test   %eax,%eax
    20ea:	0f 84 bb 02 00 00    	je     23ab <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	68 a5 46 00 00       	push   $0x46a5
    20f8:	e8 55 18 00 00       	call   3952 <chdir>
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	85 c0                	test   %eax,%eax
    2102:	0f 84 90 02 00 00    	je     2398 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    2108:	83 ec 0c             	sub    $0xc,%esp
    210b:	68 5a 45 00 00       	push   $0x455a
    2110:	e8 1d 18 00 00       	call   3932 <unlink>
    2115:	83 c4 10             	add    $0x10,%esp
    2118:	85 c0                	test   %eax,%eax
    211a:	0f 85 9d 00 00 00    	jne    21bd <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    2120:	83 ec 0c             	sub    $0xc,%esp
    2123:	68 f9 44 00 00       	push   $0x44f9
    2128:	e8 05 18 00 00       	call   3932 <unlink>
    212d:	83 c4 10             	add    $0x10,%esp
    2130:	85 c0                	test   %eax,%eax
    2132:	0f 85 4d 02 00 00    	jne    2385 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    2138:	83 ec 0c             	sub    $0xc,%esp
    213b:	68 c0 45 00 00       	push   $0x45c0
    2140:	e8 ed 17 00 00       	call   3932 <unlink>
    2145:	83 c4 10             	add    $0x10,%esp
    2148:	85 c0                	test   %eax,%eax
    214a:	0f 84 22 02 00 00    	je     2372 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    2150:	83 ec 0c             	sub    $0xc,%esp
    2153:	68 d5 44 00 00       	push   $0x44d5
    2158:	e8 d5 17 00 00       	call   3932 <unlink>
    215d:	83 c4 10             	add    $0x10,%esp
    2160:	85 c0                	test   %eax,%eax
    2162:	0f 88 f7 01 00 00    	js     235f <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2168:	83 ec 0c             	sub    $0xc,%esp
    216b:	68 c0 45 00 00       	push   $0x45c0
    2170:	e8 bd 17 00 00       	call   3932 <unlink>
    2175:	83 c4 10             	add    $0x10,%esp
    2178:	85 c0                	test   %eax,%eax
    217a:	0f 88 cc 01 00 00    	js     234c <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2180:	83 ec 08             	sub    $0x8,%esp
    2183:	68 a2 47 00 00       	push   $0x47a2
    2188:	6a 01                	push   $0x1
    218a:	e8 a1 18 00 00       	call   3a30 <printf>
}
    218f:	83 c4 10             	add    $0x10,%esp
    2192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2195:	c9                   	leave  
    2196:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2197:	50                   	push   %eax
    2198:	50                   	push   %eax
    2199:	68 3f 45 00 00       	push   $0x453f
    219e:	6a 01                	push   $0x1
    21a0:	e8 8b 18 00 00       	call   3a30 <printf>
    exit();
    21a5:	e8 38 17 00 00       	call   38e2 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    21aa:	50                   	push   %eax
    21ab:	50                   	push   %eax
    21ac:	68 9a 45 00 00       	push   $0x459a
    21b1:	6a 01                	push   $0x1
    21b3:	e8 78 18 00 00       	call   3a30 <printf>
    exit();
    21b8:	e8 25 17 00 00       	call   38e2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    21bd:	52                   	push   %edx
    21be:	52                   	push   %edx
    21bf:	68 65 45 00 00       	push   $0x4565
    21c4:	6a 01                	push   $0x1
    21c6:	e8 65 18 00 00       	call   3a30 <printf>
    exit();
    21cb:	e8 12 17 00 00       	call   38e2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    21d0:	50                   	push   %eax
    21d1:	50                   	push   %eax
    21d2:	68 17 46 00 00       	push   $0x4617
    21d7:	6a 01                	push   $0x1
    21d9:	e8 52 18 00 00       	call   3a30 <printf>
    exit();
    21de:	e8 ff 16 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21e3:	52                   	push   %edx
    21e4:	52                   	push   %edx
    21e5:	68 d8 4f 00 00       	push   $0x4fd8
    21ea:	6a 01                	push   $0x1
    21ec:	e8 3f 18 00 00       	call   3a30 <printf>
    exit();
    21f1:	e8 ec 16 00 00       	call   38e2 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21f6:	52                   	push   %edx
    21f7:	52                   	push   %edx
    21f8:	68 ab 46 00 00       	push   $0x46ab
    21fd:	6a 01                	push   $0x1
    21ff:	e8 2c 18 00 00       	call   3a30 <printf>
    exit();
    2204:	e8 d9 16 00 00       	call   38e2 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2209:	51                   	push   %ecx
    220a:	51                   	push   %ecx
    220b:	68 48 50 00 00       	push   $0x5048
    2210:	6a 01                	push   $0x1
    2212:	e8 19 18 00 00       	call   3a30 <printf>
    exit();
    2217:	e8 c6 16 00 00       	call   38e2 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    221c:	50                   	push   %eax
    221d:	50                   	push   %eax
    221e:	68 26 45 00 00       	push   $0x4526
    2223:	6a 01                	push   $0x1
    2225:	e8 06 18 00 00       	call   3a30 <printf>
    exit();
    222a:	e8 b3 16 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    222f:	51                   	push   %ecx
    2230:	51                   	push   %ecx
    2231:	68 ff 44 00 00       	push   $0x44ff
    2236:	6a 01                	push   $0x1
    2238:	e8 f3 17 00 00       	call   3a30 <printf>
    exit();
    223d:	e8 a0 16 00 00       	call   38e2 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2242:	50                   	push   %eax
    2243:	50                   	push   %eax
    2244:	68 c8 45 00 00       	push   $0x45c8
    2249:	6a 01                	push   $0x1
    224b:	e8 e0 17 00 00       	call   3a30 <printf>
    exit();
    2250:	e8 8d 16 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2255:	51                   	push   %ecx
    2256:	51                   	push   %ecx
    2257:	68 90 4f 00 00       	push   $0x4f90
    225c:	6a 01                	push   $0x1
    225e:	e8 cd 17 00 00       	call   3a30 <printf>
    exit();
    2263:	e8 7a 16 00 00       	call   38e2 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2268:	53                   	push   %ebx
    2269:	53                   	push   %ebx
    226a:	68 24 50 00 00       	push   $0x5024
    226f:	6a 01                	push   $0x1
    2271:	e8 ba 17 00 00       	call   3a30 <printf>
    exit();
    2276:	e8 67 16 00 00       	call   38e2 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    227b:	50                   	push   %eax
    227c:	50                   	push   %eax
    227d:	68 00 50 00 00       	push   $0x5000
    2282:	6a 01                	push   $0x1
    2284:	e8 a7 17 00 00       	call   3a30 <printf>
    exit();
    2289:	e8 54 16 00 00       	call   38e2 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    228e:	50                   	push   %eax
    228f:	50                   	push   %eax
    2290:	68 87 46 00 00       	push   $0x4687
    2295:	6a 01                	push   $0x1
    2297:	e8 94 17 00 00       	call   3a30 <printf>
    exit();
    229c:	e8 41 16 00 00       	call   38e2 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    22a1:	50                   	push   %eax
    22a2:	50                   	push   %eax
    22a3:	68 6e 46 00 00       	push   $0x466e
    22a8:	6a 01                	push   $0x1
    22aa:	e8 81 17 00 00       	call   3a30 <printf>
    exit();
    22af:	e8 2e 16 00 00       	call   38e2 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    22b4:	50                   	push   %eax
    22b5:	50                   	push   %eax
    22b6:	68 58 46 00 00       	push   $0x4658
    22bb:	6a 01                	push   $0x1
    22bd:	e8 6e 17 00 00       	call   3a30 <printf>
    exit();
    22c2:	e8 1b 16 00 00       	call   38e2 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    22c7:	50                   	push   %eax
    22c8:	50                   	push   %eax
    22c9:	68 3c 46 00 00       	push   $0x463c
    22ce:	6a 01                	push   $0x1
    22d0:	e8 5b 17 00 00       	call   3a30 <printf>
    exit();
    22d5:	e8 08 16 00 00       	call   38e2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    22da:	50                   	push   %eax
    22db:	50                   	push   %eax
    22dc:	68 7d 45 00 00       	push   $0x457d
    22e1:	6a 01                	push   $0x1
    22e3:	e8 48 17 00 00       	call   3a30 <printf>
    exit();
    22e8:	e8 f5 15 00 00       	call   38e2 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22ed:	50                   	push   %eax
    22ee:	50                   	push   %eax
    22ef:	68 b4 4f 00 00       	push   $0x4fb4
    22f4:	6a 01                	push   $0x1
    22f6:	e8 35 17 00 00       	call   3a30 <printf>
    exit();
    22fb:	e8 e2 15 00 00       	call   38e2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    2300:	53                   	push   %ebx
    2301:	53                   	push   %ebx
    2302:	68 db 44 00 00       	push   $0x44db
    2307:	6a 01                	push   $0x1
    2309:	e8 22 17 00 00       	call   3a30 <printf>
    exit();
    230e:	e8 cf 15 00 00       	call   38e2 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2313:	50                   	push   %eax
    2314:	50                   	push   %eax
    2315:	68 68 4f 00 00       	push   $0x4f68
    231a:	6a 01                	push   $0x1
    231c:	e8 0f 17 00 00       	call   3a30 <printf>
    exit();
    2321:	e8 bc 15 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    2326:	50                   	push   %eax
    2327:	50                   	push   %eax
    2328:	68 bf 44 00 00       	push   $0x44bf
    232d:	6a 01                	push   $0x1
    232f:	e8 fc 16 00 00       	call   3a30 <printf>
    exit();
    2334:	e8 a9 15 00 00       	call   38e2 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    2339:	50                   	push   %eax
    233a:	50                   	push   %eax
    233b:	68 a7 44 00 00       	push   $0x44a7
    2340:	6a 01                	push   $0x1
    2342:	e8 e9 16 00 00       	call   3a30 <printf>
    exit();
    2347:	e8 96 15 00 00       	call   38e2 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    234c:	50                   	push   %eax
    234d:	50                   	push   %eax
    234e:	68 90 47 00 00       	push   $0x4790
    2353:	6a 01                	push   $0x1
    2355:	e8 d6 16 00 00       	call   3a30 <printf>
    exit();
    235a:	e8 83 15 00 00       	call   38e2 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    235f:	52                   	push   %edx
    2360:	52                   	push   %edx
    2361:	68 7b 47 00 00       	push   $0x477b
    2366:	6a 01                	push   $0x1
    2368:	e8 c3 16 00 00       	call   3a30 <printf>
    exit();
    236d:	e8 70 15 00 00       	call   38e2 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2372:	51                   	push   %ecx
    2373:	51                   	push   %ecx
    2374:	68 6c 50 00 00       	push   $0x506c
    2379:	6a 01                	push   $0x1
    237b:	e8 b0 16 00 00       	call   3a30 <printf>
    exit();
    2380:	e8 5d 15 00 00       	call   38e2 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2385:	53                   	push   %ebx
    2386:	53                   	push   %ebx
    2387:	68 66 47 00 00       	push   $0x4766
    238c:	6a 01                	push   $0x1
    238e:	e8 9d 16 00 00       	call   3a30 <printf>
    exit();
    2393:	e8 4a 15 00 00       	call   38e2 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2398:	50                   	push   %eax
    2399:	50                   	push   %eax
    239a:	68 4e 47 00 00       	push   $0x474e
    239f:	6a 01                	push   $0x1
    23a1:	e8 8a 16 00 00       	call   3a30 <printf>
    exit();
    23a6:	e8 37 15 00 00       	call   38e2 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    23ab:	50                   	push   %eax
    23ac:	50                   	push   %eax
    23ad:	68 36 47 00 00       	push   $0x4736
    23b2:	6a 01                	push   $0x1
    23b4:	e8 77 16 00 00       	call   3a30 <printf>
    exit();
    23b9:	e8 24 15 00 00       	call   38e2 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    23be:	50                   	push   %eax
    23bf:	50                   	push   %eax
    23c0:	68 1a 47 00 00       	push   $0x471a
    23c5:	6a 01                	push   $0x1
    23c7:	e8 64 16 00 00       	call   3a30 <printf>
    exit();
    23cc:	e8 11 15 00 00       	call   38e2 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    23d1:	50                   	push   %eax
    23d2:	50                   	push   %eax
    23d3:	68 fe 46 00 00       	push   $0x46fe
    23d8:	6a 01                	push   $0x1
    23da:	e8 51 16 00 00       	call   3a30 <printf>
    exit();
    23df:	e8 fe 14 00 00       	call   38e2 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23e4:	50                   	push   %eax
    23e5:	50                   	push   %eax
    23e6:	68 e1 46 00 00       	push   $0x46e1
    23eb:	6a 01                	push   $0x1
    23ed:	e8 3e 16 00 00       	call   3a30 <printf>
    exit();
    23f2:	e8 eb 14 00 00       	call   38e2 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23f7:	50                   	push   %eax
    23f8:	50                   	push   %eax
    23f9:	68 c6 46 00 00       	push   $0x46c6
    23fe:	6a 01                	push   $0x1
    2400:	e8 2b 16 00 00       	call   3a30 <printf>
    exit();
    2405:	e8 d8 14 00 00       	call   38e2 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    240a:	50                   	push   %eax
    240b:	50                   	push   %eax
    240c:	68 f3 45 00 00       	push   $0x45f3
    2411:	6a 01                	push   $0x1
    2413:	e8 18 16 00 00       	call   3a30 <printf>
    exit();
    2418:	e8 c5 14 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    241d:	50                   	push   %eax
    241e:	50                   	push   %eax
    241f:	68 db 45 00 00       	push   $0x45db
    2424:	6a 01                	push   $0x1
    2426:	e8 05 16 00 00       	call   3a30 <printf>
    exit();
    242b:	e8 b2 14 00 00       	call   38e2 <exit>

00002430 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    2430:	55                   	push   %ebp
    2431:	89 e5                	mov    %esp,%ebp
    2433:	56                   	push   %esi
    2434:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2435:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    243a:	83 ec 08             	sub    $0x8,%esp
    243d:	68 ad 47 00 00       	push   $0x47ad
    2442:	6a 01                	push   $0x1
    2444:	e8 e7 15 00 00       	call   3a30 <printf>

  unlink("bigwrite");
    2449:	c7 04 24 bc 47 00 00 	movl   $0x47bc,(%esp)
    2450:	e8 dd 14 00 00       	call   3932 <unlink>
    2455:	83 c4 10             	add    $0x10,%esp
    2458:	90                   	nop
    2459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2460:	83 ec 08             	sub    $0x8,%esp
    2463:	68 02 02 00 00       	push   $0x202
    2468:	68 bc 47 00 00       	push   $0x47bc
    246d:	e8 b0 14 00 00       	call   3922 <open>
    if(fd < 0){
    2472:	83 c4 10             	add    $0x10,%esp
    2475:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2477:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2479:	78 7e                	js     24f9 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    247b:	83 ec 04             	sub    $0x4,%esp
    247e:	53                   	push   %ebx
    247f:	68 80 85 00 00       	push   $0x8580
    2484:	50                   	push   %eax
    2485:	e8 78 14 00 00       	call   3902 <write>
      if(cc != sz){
    248a:	83 c4 10             	add    $0x10,%esp
    248d:	39 c3                	cmp    %eax,%ebx
    248f:	75 55                	jne    24e6 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2491:	83 ec 04             	sub    $0x4,%esp
    2494:	53                   	push   %ebx
    2495:	68 80 85 00 00       	push   $0x8580
    249a:	56                   	push   %esi
    249b:	e8 62 14 00 00       	call   3902 <write>
      if(cc != sz){
    24a0:	83 c4 10             	add    $0x10,%esp
    24a3:	39 c3                	cmp    %eax,%ebx
    24a5:	75 3f                	jne    24e6 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    24a7:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24aa:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    24b0:	56                   	push   %esi
    24b1:	e8 54 14 00 00       	call   390a <close>
    unlink("bigwrite");
    24b6:	c7 04 24 bc 47 00 00 	movl   $0x47bc,(%esp)
    24bd:	e8 70 14 00 00       	call   3932 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24c2:	83 c4 10             	add    $0x10,%esp
    24c5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    24cb:	75 93                	jne    2460 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    24cd:	83 ec 08             	sub    $0x8,%esp
    24d0:	68 ef 47 00 00       	push   $0x47ef
    24d5:	6a 01                	push   $0x1
    24d7:	e8 54 15 00 00       	call   3a30 <printf>
}
    24dc:	83 c4 10             	add    $0x10,%esp
    24df:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24e2:	5b                   	pop    %ebx
    24e3:	5e                   	pop    %esi
    24e4:	5d                   	pop    %ebp
    24e5:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    24e6:	50                   	push   %eax
    24e7:	53                   	push   %ebx
    24e8:	68 dd 47 00 00       	push   $0x47dd
    24ed:	6a 01                	push   $0x1
    24ef:	e8 3c 15 00 00       	call   3a30 <printf>
        exit();
    24f4:	e8 e9 13 00 00       	call   38e2 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    24f9:	83 ec 08             	sub    $0x8,%esp
    24fc:	68 c5 47 00 00       	push   $0x47c5
    2501:	6a 01                	push   $0x1
    2503:	e8 28 15 00 00       	call   3a30 <printf>
      exit();
    2508:	e8 d5 13 00 00       	call   38e2 <exit>
    250d:	8d 76 00             	lea    0x0(%esi),%esi

00002510 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    2510:	55                   	push   %ebp
    2511:	89 e5                	mov    %esp,%ebp
    2513:	57                   	push   %edi
    2514:	56                   	push   %esi
    2515:	53                   	push   %ebx
    2516:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2519:	68 fc 47 00 00       	push   $0x47fc
    251e:	6a 01                	push   $0x1
    2520:	e8 0b 15 00 00       	call   3a30 <printf>

  unlink("bigfile");
    2525:	c7 04 24 18 48 00 00 	movl   $0x4818,(%esp)
    252c:	e8 01 14 00 00       	call   3932 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2531:	5e                   	pop    %esi
    2532:	5f                   	pop    %edi
    2533:	68 02 02 00 00       	push   $0x202
    2538:	68 18 48 00 00       	push   $0x4818
    253d:	e8 e0 13 00 00       	call   3922 <open>
  if(fd < 0){
    2542:	83 c4 10             	add    $0x10,%esp
    2545:	85 c0                	test   %eax,%eax
    2547:	0f 88 5f 01 00 00    	js     26ac <bigfile+0x19c>
    254d:	89 c6                	mov    %eax,%esi
    254f:	31 db                	xor    %ebx,%ebx
    2551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    2558:	83 ec 04             	sub    $0x4,%esp
    255b:	68 58 02 00 00       	push   $0x258
    2560:	53                   	push   %ebx
    2561:	68 80 85 00 00       	push   $0x8580
    2566:	e8 e5 11 00 00       	call   3750 <memset>
    if(write(fd, buf, 600) != 600){
    256b:	83 c4 0c             	add    $0xc,%esp
    256e:	68 58 02 00 00       	push   $0x258
    2573:	68 80 85 00 00       	push   $0x8580
    2578:	56                   	push   %esi
    2579:	e8 84 13 00 00       	call   3902 <write>
    257e:	83 c4 10             	add    $0x10,%esp
    2581:	3d 58 02 00 00       	cmp    $0x258,%eax
    2586:	0f 85 f8 00 00 00    	jne    2684 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    258c:	83 c3 01             	add    $0x1,%ebx
    258f:	83 fb 14             	cmp    $0x14,%ebx
    2592:	75 c4                	jne    2558 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2594:	83 ec 0c             	sub    $0xc,%esp
    2597:	56                   	push   %esi
    2598:	e8 6d 13 00 00       	call   390a <close>

  fd = open("bigfile", 0);
    259d:	59                   	pop    %ecx
    259e:	5b                   	pop    %ebx
    259f:	6a 00                	push   $0x0
    25a1:	68 18 48 00 00       	push   $0x4818
    25a6:	e8 77 13 00 00       	call   3922 <open>
  if(fd < 0){
    25ab:	83 c4 10             	add    $0x10,%esp
    25ae:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    25b0:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    25b2:	0f 88 e0 00 00 00    	js     2698 <bigfile+0x188>
    25b8:	31 db                	xor    %ebx,%ebx
    25ba:	31 ff                	xor    %edi,%edi
    25bc:	eb 30                	jmp    25ee <bigfile+0xde>
    25be:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    25c0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25c5:	0f 85 91 00 00 00    	jne    265c <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    25cb:	0f be 05 80 85 00 00 	movsbl 0x8580,%eax
    25d2:	89 fa                	mov    %edi,%edx
    25d4:	d1 fa                	sar    %edx
    25d6:	39 d0                	cmp    %edx,%eax
    25d8:	75 6e                	jne    2648 <bigfile+0x138>
    25da:	0f be 15 ab 86 00 00 	movsbl 0x86ab,%edx
    25e1:	39 d0                	cmp    %edx,%eax
    25e3:	75 63                	jne    2648 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    25e5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    25eb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ee:	83 ec 04             	sub    $0x4,%esp
    25f1:	68 2c 01 00 00       	push   $0x12c
    25f6:	68 80 85 00 00       	push   $0x8580
    25fb:	56                   	push   %esi
    25fc:	e8 f9 12 00 00       	call   38fa <read>
    if(cc < 0){
    2601:	83 c4 10             	add    $0x10,%esp
    2604:	85 c0                	test   %eax,%eax
    2606:	78 68                	js     2670 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    2608:	75 b6                	jne    25c0 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    260a:	83 ec 0c             	sub    $0xc,%esp
    260d:	56                   	push   %esi
    260e:	e8 f7 12 00 00       	call   390a <close>
  if(total != 20*600){
    2613:	83 c4 10             	add    $0x10,%esp
    2616:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    261c:	0f 85 9e 00 00 00    	jne    26c0 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2622:	83 ec 0c             	sub    $0xc,%esp
    2625:	68 18 48 00 00       	push   $0x4818
    262a:	e8 03 13 00 00       	call   3932 <unlink>

  printf(1, "bigfile test ok\n");
    262f:	58                   	pop    %eax
    2630:	5a                   	pop    %edx
    2631:	68 a7 48 00 00       	push   $0x48a7
    2636:	6a 01                	push   $0x1
    2638:	e8 f3 13 00 00       	call   3a30 <printf>
}
    263d:	83 c4 10             	add    $0x10,%esp
    2640:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2643:	5b                   	pop    %ebx
    2644:	5e                   	pop    %esi
    2645:	5f                   	pop    %edi
    2646:	5d                   	pop    %ebp
    2647:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    2648:	83 ec 08             	sub    $0x8,%esp
    264b:	68 74 48 00 00       	push   $0x4874
    2650:	6a 01                	push   $0x1
    2652:	e8 d9 13 00 00       	call   3a30 <printf>
      exit();
    2657:	e8 86 12 00 00       	call   38e2 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    265c:	83 ec 08             	sub    $0x8,%esp
    265f:	68 60 48 00 00       	push   $0x4860
    2664:	6a 01                	push   $0x1
    2666:	e8 c5 13 00 00       	call   3a30 <printf>
      exit();
    266b:	e8 72 12 00 00       	call   38e2 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2670:	83 ec 08             	sub    $0x8,%esp
    2673:	68 4b 48 00 00       	push   $0x484b
    2678:	6a 01                	push   $0x1
    267a:	e8 b1 13 00 00       	call   3a30 <printf>
      exit();
    267f:	e8 5e 12 00 00       	call   38e2 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2684:	83 ec 08             	sub    $0x8,%esp
    2687:	68 20 48 00 00       	push   $0x4820
    268c:	6a 01                	push   $0x1
    268e:	e8 9d 13 00 00       	call   3a30 <printf>
      exit();
    2693:	e8 4a 12 00 00       	call   38e2 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2698:	83 ec 08             	sub    $0x8,%esp
    269b:	68 36 48 00 00       	push   $0x4836
    26a0:	6a 01                	push   $0x1
    26a2:	e8 89 13 00 00       	call   3a30 <printf>
    exit();
    26a7:	e8 36 12 00 00       	call   38e2 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    26ac:	83 ec 08             	sub    $0x8,%esp
    26af:	68 0a 48 00 00       	push   $0x480a
    26b4:	6a 01                	push   $0x1
    26b6:	e8 75 13 00 00       	call   3a30 <printf>
    exit();
    26bb:	e8 22 12 00 00       	call   38e2 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    26c0:	83 ec 08             	sub    $0x8,%esp
    26c3:	68 8d 48 00 00       	push   $0x488d
    26c8:	6a 01                	push   $0x1
    26ca:	e8 61 13 00 00       	call   3a30 <printf>
    exit();
    26cf:	e8 0e 12 00 00       	call   38e2 <exit>
    26d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    26da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000026e0 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    26e0:	55                   	push   %ebp
    26e1:	89 e5                	mov    %esp,%ebp
    26e3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    26e6:	68 b8 48 00 00       	push   $0x48b8
    26eb:	6a 01                	push   $0x1
    26ed:	e8 3e 13 00 00       	call   3a30 <printf>

  if(mkdir("12345678901234") != 0){
    26f2:	c7 04 24 f3 48 00 00 	movl   $0x48f3,(%esp)
    26f9:	e8 4c 12 00 00       	call   394a <mkdir>
    26fe:	83 c4 10             	add    $0x10,%esp
    2701:	85 c0                	test   %eax,%eax
    2703:	0f 85 97 00 00 00    	jne    27a0 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2709:	83 ec 0c             	sub    $0xc,%esp
    270c:	68 8c 50 00 00       	push   $0x508c
    2711:	e8 34 12 00 00       	call   394a <mkdir>
    2716:	83 c4 10             	add    $0x10,%esp
    2719:	85 c0                	test   %eax,%eax
    271b:	0f 85 de 00 00 00    	jne    27ff <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2721:	83 ec 08             	sub    $0x8,%esp
    2724:	68 00 02 00 00       	push   $0x200
    2729:	68 dc 50 00 00       	push   $0x50dc
    272e:	e8 ef 11 00 00       	call   3922 <open>
  if(fd < 0){
    2733:	83 c4 10             	add    $0x10,%esp
    2736:	85 c0                	test   %eax,%eax
    2738:	0f 88 ae 00 00 00    	js     27ec <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    273e:	83 ec 0c             	sub    $0xc,%esp
    2741:	50                   	push   %eax
    2742:	e8 c3 11 00 00       	call   390a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2747:	58                   	pop    %eax
    2748:	5a                   	pop    %edx
    2749:	6a 00                	push   $0x0
    274b:	68 4c 51 00 00       	push   $0x514c
    2750:	e8 cd 11 00 00       	call   3922 <open>
  if(fd < 0){
    2755:	83 c4 10             	add    $0x10,%esp
    2758:	85 c0                	test   %eax,%eax
    275a:	78 7d                	js     27d9 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    275c:	83 ec 0c             	sub    $0xc,%esp
    275f:	50                   	push   %eax
    2760:	e8 a5 11 00 00       	call   390a <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2765:	c7 04 24 e4 48 00 00 	movl   $0x48e4,(%esp)
    276c:	e8 d9 11 00 00       	call   394a <mkdir>
    2771:	83 c4 10             	add    $0x10,%esp
    2774:	85 c0                	test   %eax,%eax
    2776:	74 4e                	je     27c6 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2778:	83 ec 0c             	sub    $0xc,%esp
    277b:	68 e8 51 00 00       	push   $0x51e8
    2780:	e8 c5 11 00 00       	call   394a <mkdir>
    2785:	83 c4 10             	add    $0x10,%esp
    2788:	85 c0                	test   %eax,%eax
    278a:	74 27                	je     27b3 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    278c:	83 ec 08             	sub    $0x8,%esp
    278f:	68 02 49 00 00       	push   $0x4902
    2794:	6a 01                	push   $0x1
    2796:	e8 95 12 00 00       	call   3a30 <printf>
}
    279b:	83 c4 10             	add    $0x10,%esp
    279e:	c9                   	leave  
    279f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    27a0:	50                   	push   %eax
    27a1:	50                   	push   %eax
    27a2:	68 c7 48 00 00       	push   $0x48c7
    27a7:	6a 01                	push   $0x1
    27a9:	e8 82 12 00 00       	call   3a30 <printf>
    exit();
    27ae:	e8 2f 11 00 00       	call   38e2 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    27b3:	50                   	push   %eax
    27b4:	50                   	push   %eax
    27b5:	68 08 52 00 00       	push   $0x5208
    27ba:	6a 01                	push   $0x1
    27bc:	e8 6f 12 00 00       	call   3a30 <printf>
    exit();
    27c1:	e8 1c 11 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27c6:	52                   	push   %edx
    27c7:	52                   	push   %edx
    27c8:	68 b8 51 00 00       	push   $0x51b8
    27cd:	6a 01                	push   $0x1
    27cf:	e8 5c 12 00 00       	call   3a30 <printf>
    exit();
    27d4:	e8 09 11 00 00       	call   38e2 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27d9:	51                   	push   %ecx
    27da:	51                   	push   %ecx
    27db:	68 7c 51 00 00       	push   $0x517c
    27e0:	6a 01                	push   $0x1
    27e2:	e8 49 12 00 00       	call   3a30 <printf>
    exit();
    27e7:	e8 f6 10 00 00       	call   38e2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27ec:	51                   	push   %ecx
    27ed:	51                   	push   %ecx
    27ee:	68 0c 51 00 00       	push   $0x510c
    27f3:	6a 01                	push   $0x1
    27f5:	e8 36 12 00 00       	call   3a30 <printf>
    exit();
    27fa:	e8 e3 10 00 00       	call   38e2 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27ff:	50                   	push   %eax
    2800:	50                   	push   %eax
    2801:	68 ac 50 00 00       	push   $0x50ac
    2806:	6a 01                	push   $0x1
    2808:	e8 23 12 00 00       	call   3a30 <printf>
    exit();
    280d:	e8 d0 10 00 00       	call   38e2 <exit>
    2812:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002820 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2820:	55                   	push   %ebp
    2821:	89 e5                	mov    %esp,%ebp
    2823:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2826:	68 0f 49 00 00       	push   $0x490f
    282b:	6a 01                	push   $0x1
    282d:	e8 fe 11 00 00       	call   3a30 <printf>
  if(mkdir("dots") != 0){
    2832:	c7 04 24 1b 49 00 00 	movl   $0x491b,(%esp)
    2839:	e8 0c 11 00 00       	call   394a <mkdir>
    283e:	83 c4 10             	add    $0x10,%esp
    2841:	85 c0                	test   %eax,%eax
    2843:	0f 85 b0 00 00 00    	jne    28f9 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2849:	83 ec 0c             	sub    $0xc,%esp
    284c:	68 1b 49 00 00       	push   $0x491b
    2851:	e8 fc 10 00 00       	call   3952 <chdir>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	85 c0                	test   %eax,%eax
    285b:	0f 85 1d 01 00 00    	jne    297e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2861:	83 ec 0c             	sub    $0xc,%esp
    2864:	68 c6 45 00 00       	push   $0x45c6
    2869:	e8 c4 10 00 00       	call   3932 <unlink>
    286e:	83 c4 10             	add    $0x10,%esp
    2871:	85 c0                	test   %eax,%eax
    2873:	0f 84 f2 00 00 00    	je     296b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2879:	83 ec 0c             	sub    $0xc,%esp
    287c:	68 c5 45 00 00       	push   $0x45c5
    2881:	e8 ac 10 00 00       	call   3932 <unlink>
    2886:	83 c4 10             	add    $0x10,%esp
    2889:	85 c0                	test   %eax,%eax
    288b:	0f 84 c7 00 00 00    	je     2958 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 99 3d 00 00       	push   $0x3d99
    2899:	e8 b4 10 00 00       	call   3952 <chdir>
    289e:	83 c4 10             	add    $0x10,%esp
    28a1:	85 c0                	test   %eax,%eax
    28a3:	0f 85 9c 00 00 00    	jne    2945 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    28a9:	83 ec 0c             	sub    $0xc,%esp
    28ac:	68 63 49 00 00       	push   $0x4963
    28b1:	e8 7c 10 00 00       	call   3932 <unlink>
    28b6:	83 c4 10             	add    $0x10,%esp
    28b9:	85 c0                	test   %eax,%eax
    28bb:	74 75                	je     2932 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    28bd:	83 ec 0c             	sub    $0xc,%esp
    28c0:	68 81 49 00 00       	push   $0x4981
    28c5:	e8 68 10 00 00       	call   3932 <unlink>
    28ca:	83 c4 10             	add    $0x10,%esp
    28cd:	85 c0                	test   %eax,%eax
    28cf:	74 4e                	je     291f <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    28d1:	83 ec 0c             	sub    $0xc,%esp
    28d4:	68 1b 49 00 00       	push   $0x491b
    28d9:	e8 54 10 00 00       	call   3932 <unlink>
    28de:	83 c4 10             	add    $0x10,%esp
    28e1:	85 c0                	test   %eax,%eax
    28e3:	75 27                	jne    290c <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    28e5:	83 ec 08             	sub    $0x8,%esp
    28e8:	68 b6 49 00 00       	push   $0x49b6
    28ed:	6a 01                	push   $0x1
    28ef:	e8 3c 11 00 00       	call   3a30 <printf>
}
    28f4:	83 c4 10             	add    $0x10,%esp
    28f7:	c9                   	leave  
    28f8:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    28f9:	50                   	push   %eax
    28fa:	50                   	push   %eax
    28fb:	68 20 49 00 00       	push   $0x4920
    2900:	6a 01                	push   $0x1
    2902:	e8 29 11 00 00       	call   3a30 <printf>
    exit();
    2907:	e8 d6 0f 00 00       	call   38e2 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    290c:	50                   	push   %eax
    290d:	50                   	push   %eax
    290e:	68 a1 49 00 00       	push   $0x49a1
    2913:	6a 01                	push   $0x1
    2915:	e8 16 11 00 00       	call   3a30 <printf>
    exit();
    291a:	e8 c3 0f 00 00       	call   38e2 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    291f:	52                   	push   %edx
    2920:	52                   	push   %edx
    2921:	68 89 49 00 00       	push   $0x4989
    2926:	6a 01                	push   $0x1
    2928:	e8 03 11 00 00       	call   3a30 <printf>
    exit();
    292d:	e8 b0 0f 00 00       	call   38e2 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2932:	51                   	push   %ecx
    2933:	51                   	push   %ecx
    2934:	68 6a 49 00 00       	push   $0x496a
    2939:	6a 01                	push   $0x1
    293b:	e8 f0 10 00 00       	call   3a30 <printf>
    exit();
    2940:	e8 9d 0f 00 00       	call   38e2 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2945:	50                   	push   %eax
    2946:	50                   	push   %eax
    2947:	68 9b 3d 00 00       	push   $0x3d9b
    294c:	6a 01                	push   $0x1
    294e:	e8 dd 10 00 00       	call   3a30 <printf>
    exit();
    2953:	e8 8a 0f 00 00       	call   38e2 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2958:	50                   	push   %eax
    2959:	50                   	push   %eax
    295a:	68 54 49 00 00       	push   $0x4954
    295f:	6a 01                	push   $0x1
    2961:	e8 ca 10 00 00       	call   3a30 <printf>
    exit();
    2966:	e8 77 0f 00 00       	call   38e2 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    296b:	50                   	push   %eax
    296c:	50                   	push   %eax
    296d:	68 46 49 00 00       	push   $0x4946
    2972:	6a 01                	push   $0x1
    2974:	e8 b7 10 00 00       	call   3a30 <printf>
    exit();
    2979:	e8 64 0f 00 00       	call   38e2 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    297e:	50                   	push   %eax
    297f:	50                   	push   %eax
    2980:	68 33 49 00 00       	push   $0x4933
    2985:	6a 01                	push   $0x1
    2987:	e8 a4 10 00 00       	call   3a30 <printf>
    exit();
    298c:	e8 51 0f 00 00       	call   38e2 <exit>
    2991:	eb 0d                	jmp    29a0 <dirfile>
    2993:	90                   	nop
    2994:	90                   	nop
    2995:	90                   	nop
    2996:	90                   	nop
    2997:	90                   	nop
    2998:	90                   	nop
    2999:	90                   	nop
    299a:	90                   	nop
    299b:	90                   	nop
    299c:	90                   	nop
    299d:	90                   	nop
    299e:	90                   	nop
    299f:	90                   	nop

000029a0 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    29a0:	55                   	push   %ebp
    29a1:	89 e5                	mov    %esp,%ebp
    29a3:	53                   	push   %ebx
    29a4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    29a7:	68 c0 49 00 00       	push   $0x49c0
    29ac:	6a 01                	push   $0x1
    29ae:	e8 7d 10 00 00       	call   3a30 <printf>

  fd = open("dirfile", O_CREATE);
    29b3:	59                   	pop    %ecx
    29b4:	5b                   	pop    %ebx
    29b5:	68 00 02 00 00       	push   $0x200
    29ba:	68 cd 49 00 00       	push   $0x49cd
    29bf:	e8 5e 0f 00 00       	call   3922 <open>
  if(fd < 0){
    29c4:	83 c4 10             	add    $0x10,%esp
    29c7:	85 c0                	test   %eax,%eax
    29c9:	0f 88 43 01 00 00    	js     2b12 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    29cf:	83 ec 0c             	sub    $0xc,%esp
    29d2:	50                   	push   %eax
    29d3:	e8 32 0f 00 00       	call   390a <close>
  if(chdir("dirfile") == 0){
    29d8:	c7 04 24 cd 49 00 00 	movl   $0x49cd,(%esp)
    29df:	e8 6e 0f 00 00       	call   3952 <chdir>
    29e4:	83 c4 10             	add    $0x10,%esp
    29e7:	85 c0                	test   %eax,%eax
    29e9:	0f 84 10 01 00 00    	je     2aff <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    29ef:	83 ec 08             	sub    $0x8,%esp
    29f2:	6a 00                	push   $0x0
    29f4:	68 06 4a 00 00       	push   $0x4a06
    29f9:	e8 24 0f 00 00       	call   3922 <open>
  if(fd >= 0){
    29fe:	83 c4 10             	add    $0x10,%esp
    2a01:	85 c0                	test   %eax,%eax
    2a03:	0f 89 e3 00 00 00    	jns    2aec <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2a09:	83 ec 08             	sub    $0x8,%esp
    2a0c:	68 00 02 00 00       	push   $0x200
    2a11:	68 06 4a 00 00       	push   $0x4a06
    2a16:	e8 07 0f 00 00       	call   3922 <open>
  if(fd >= 0){
    2a1b:	83 c4 10             	add    $0x10,%esp
    2a1e:	85 c0                	test   %eax,%eax
    2a20:	0f 89 c6 00 00 00    	jns    2aec <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    2a26:	83 ec 0c             	sub    $0xc,%esp
    2a29:	68 06 4a 00 00       	push   $0x4a06
    2a2e:	e8 17 0f 00 00       	call   394a <mkdir>
    2a33:	83 c4 10             	add    $0x10,%esp
    2a36:	85 c0                	test   %eax,%eax
    2a38:	0f 84 46 01 00 00    	je     2b84 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    2a3e:	83 ec 0c             	sub    $0xc,%esp
    2a41:	68 06 4a 00 00       	push   $0x4a06
    2a46:	e8 e7 0e 00 00       	call   3932 <unlink>
    2a4b:	83 c4 10             	add    $0x10,%esp
    2a4e:	85 c0                	test   %eax,%eax
    2a50:	0f 84 1b 01 00 00    	je     2b71 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2a56:	83 ec 08             	sub    $0x8,%esp
    2a59:	68 06 4a 00 00       	push   $0x4a06
    2a5e:	68 6a 4a 00 00       	push   $0x4a6a
    2a63:	e8 da 0e 00 00       	call   3942 <link>
    2a68:	83 c4 10             	add    $0x10,%esp
    2a6b:	85 c0                	test   %eax,%eax
    2a6d:	0f 84 eb 00 00 00    	je     2b5e <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a73:	83 ec 0c             	sub    $0xc,%esp
    2a76:	68 cd 49 00 00       	push   $0x49cd
    2a7b:	e8 b2 0e 00 00       	call   3932 <unlink>
    2a80:	83 c4 10             	add    $0x10,%esp
    2a83:	85 c0                	test   %eax,%eax
    2a85:	0f 85 c0 00 00 00    	jne    2b4b <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a8b:	83 ec 08             	sub    $0x8,%esp
    2a8e:	6a 02                	push   $0x2
    2a90:	68 c6 45 00 00       	push   $0x45c6
    2a95:	e8 88 0e 00 00       	call   3922 <open>
  if(fd >= 0){
    2a9a:	83 c4 10             	add    $0x10,%esp
    2a9d:	85 c0                	test   %eax,%eax
    2a9f:	0f 89 93 00 00 00    	jns    2b38 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2aa5:	83 ec 08             	sub    $0x8,%esp
    2aa8:	6a 00                	push   $0x0
    2aaa:	68 c6 45 00 00       	push   $0x45c6
    2aaf:	e8 6e 0e 00 00       	call   3922 <open>
  if(write(fd, "x", 1) > 0){
    2ab4:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2ab7:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2ab9:	6a 01                	push   $0x1
    2abb:	68 a9 46 00 00       	push   $0x46a9
    2ac0:	50                   	push   %eax
    2ac1:	e8 3c 0e 00 00       	call   3902 <write>
    2ac6:	83 c4 10             	add    $0x10,%esp
    2ac9:	85 c0                	test   %eax,%eax
    2acb:	7f 58                	jg     2b25 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2acd:	83 ec 0c             	sub    $0xc,%esp
    2ad0:	53                   	push   %ebx
    2ad1:	e8 34 0e 00 00       	call   390a <close>

  printf(1, "dir vs file OK\n");
    2ad6:	58                   	pop    %eax
    2ad7:	5a                   	pop    %edx
    2ad8:	68 9d 4a 00 00       	push   $0x4a9d
    2add:	6a 01                	push   $0x1
    2adf:	e8 4c 0f 00 00       	call   3a30 <printf>
}
    2ae4:	83 c4 10             	add    $0x10,%esp
    2ae7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aea:	c9                   	leave  
    2aeb:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2aec:	50                   	push   %eax
    2aed:	50                   	push   %eax
    2aee:	68 11 4a 00 00       	push   $0x4a11
    2af3:	6a 01                	push   $0x1
    2af5:	e8 36 0f 00 00       	call   3a30 <printf>
    exit();
    2afa:	e8 e3 0d 00 00       	call   38e2 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2aff:	50                   	push   %eax
    2b00:	50                   	push   %eax
    2b01:	68 ec 49 00 00       	push   $0x49ec
    2b06:	6a 01                	push   $0x1
    2b08:	e8 23 0f 00 00       	call   3a30 <printf>
    exit();
    2b0d:	e8 d0 0d 00 00       	call   38e2 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2b12:	52                   	push   %edx
    2b13:	52                   	push   %edx
    2b14:	68 d5 49 00 00       	push   $0x49d5
    2b19:	6a 01                	push   $0x1
    2b1b:	e8 10 0f 00 00       	call   3a30 <printf>
    exit();
    2b20:	e8 bd 0d 00 00       	call   38e2 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2b25:	51                   	push   %ecx
    2b26:	51                   	push   %ecx
    2b27:	68 89 4a 00 00       	push   $0x4a89
    2b2c:	6a 01                	push   $0x1
    2b2e:	e8 fd 0e 00 00       	call   3a30 <printf>
    exit();
    2b33:	e8 aa 0d 00 00       	call   38e2 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2b38:	53                   	push   %ebx
    2b39:	53                   	push   %ebx
    2b3a:	68 5c 52 00 00       	push   $0x525c
    2b3f:	6a 01                	push   $0x1
    2b41:	e8 ea 0e 00 00       	call   3a30 <printf>
    exit();
    2b46:	e8 97 0d 00 00       	call   38e2 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2b4b:	50                   	push   %eax
    2b4c:	50                   	push   %eax
    2b4d:	68 71 4a 00 00       	push   $0x4a71
    2b52:	6a 01                	push   $0x1
    2b54:	e8 d7 0e 00 00       	call   3a30 <printf>
    exit();
    2b59:	e8 84 0d 00 00       	call   38e2 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2b5e:	50                   	push   %eax
    2b5f:	50                   	push   %eax
    2b60:	68 3c 52 00 00       	push   $0x523c
    2b65:	6a 01                	push   $0x1
    2b67:	e8 c4 0e 00 00       	call   3a30 <printf>
    exit();
    2b6c:	e8 71 0d 00 00       	call   38e2 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b71:	50                   	push   %eax
    2b72:	50                   	push   %eax
    2b73:	68 4c 4a 00 00       	push   $0x4a4c
    2b78:	6a 01                	push   $0x1
    2b7a:	e8 b1 0e 00 00       	call   3a30 <printf>
    exit();
    2b7f:	e8 5e 0d 00 00       	call   38e2 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b84:	50                   	push   %eax
    2b85:	50                   	push   %eax
    2b86:	68 2f 4a 00 00       	push   $0x4a2f
    2b8b:	6a 01                	push   $0x1
    2b8d:	e8 9e 0e 00 00       	call   3a30 <printf>
    exit();
    2b92:	e8 4b 0d 00 00       	call   38e2 <exit>
    2b97:	89 f6                	mov    %esi,%esi
    2b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002ba0 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2ba0:	55                   	push   %ebp
    2ba1:	89 e5                	mov    %esp,%ebp
    2ba3:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2ba4:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2ba9:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2bac:	68 ad 4a 00 00       	push   $0x4aad
    2bb1:	6a 01                	push   $0x1
    2bb3:	e8 78 0e 00 00       	call   3a30 <printf>
    2bb8:	83 c4 10             	add    $0x10,%esp
    2bbb:	90                   	nop
    2bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2bc0:	83 ec 0c             	sub    $0xc,%esp
    2bc3:	68 be 4a 00 00       	push   $0x4abe
    2bc8:	e8 7d 0d 00 00       	call   394a <mkdir>
    2bcd:	83 c4 10             	add    $0x10,%esp
    2bd0:	85 c0                	test   %eax,%eax
    2bd2:	0f 85 bb 00 00 00    	jne    2c93 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2bd8:	83 ec 0c             	sub    $0xc,%esp
    2bdb:	68 be 4a 00 00       	push   $0x4abe
    2be0:	e8 6d 0d 00 00       	call   3952 <chdir>
    2be5:	83 c4 10             	add    $0x10,%esp
    2be8:	85 c0                	test   %eax,%eax
    2bea:	0f 85 b7 00 00 00    	jne    2ca7 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2bf0:	83 ec 0c             	sub    $0xc,%esp
    2bf3:	68 73 41 00 00       	push   $0x4173
    2bf8:	e8 4d 0d 00 00       	call   394a <mkdir>
    link("README", "");
    2bfd:	59                   	pop    %ecx
    2bfe:	58                   	pop    %eax
    2bff:	68 73 41 00 00       	push   $0x4173
    2c04:	68 6a 4a 00 00       	push   $0x4a6a
    2c09:	e8 34 0d 00 00       	call   3942 <link>
    fd = open("", O_CREATE);
    2c0e:	58                   	pop    %eax
    2c0f:	5a                   	pop    %edx
    2c10:	68 00 02 00 00       	push   $0x200
    2c15:	68 73 41 00 00       	push   $0x4173
    2c1a:	e8 03 0d 00 00       	call   3922 <open>
    if(fd >= 0)
    2c1f:	83 c4 10             	add    $0x10,%esp
    2c22:	85 c0                	test   %eax,%eax
    2c24:	78 0c                	js     2c32 <iref+0x92>
      close(fd);
    2c26:	83 ec 0c             	sub    $0xc,%esp
    2c29:	50                   	push   %eax
    2c2a:	e8 db 0c 00 00       	call   390a <close>
    2c2f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c32:	83 ec 08             	sub    $0x8,%esp
    2c35:	68 00 02 00 00       	push   $0x200
    2c3a:	68 a8 46 00 00       	push   $0x46a8
    2c3f:	e8 de 0c 00 00       	call   3922 <open>
    if(fd >= 0)
    2c44:	83 c4 10             	add    $0x10,%esp
    2c47:	85 c0                	test   %eax,%eax
    2c49:	78 0c                	js     2c57 <iref+0xb7>
      close(fd);
    2c4b:	83 ec 0c             	sub    $0xc,%esp
    2c4e:	50                   	push   %eax
    2c4f:	e8 b6 0c 00 00       	call   390a <close>
    2c54:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c57:	83 ec 0c             	sub    $0xc,%esp
    2c5a:	68 a8 46 00 00       	push   $0x46a8
    2c5f:	e8 ce 0c 00 00       	call   3932 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c64:	83 c4 10             	add    $0x10,%esp
    2c67:	83 eb 01             	sub    $0x1,%ebx
    2c6a:	0f 85 50 ff ff ff    	jne    2bc0 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c70:	83 ec 0c             	sub    $0xc,%esp
    2c73:	68 99 3d 00 00       	push   $0x3d99
    2c78:	e8 d5 0c 00 00       	call   3952 <chdir>
  printf(1, "empty file name OK\n");
    2c7d:	58                   	pop    %eax
    2c7e:	5a                   	pop    %edx
    2c7f:	68 ec 4a 00 00       	push   $0x4aec
    2c84:	6a 01                	push   $0x1
    2c86:	e8 a5 0d 00 00       	call   3a30 <printf>
}
    2c8b:	83 c4 10             	add    $0x10,%esp
    2c8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c91:	c9                   	leave  
    2c92:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c93:	83 ec 08             	sub    $0x8,%esp
    2c96:	68 c4 4a 00 00       	push   $0x4ac4
    2c9b:	6a 01                	push   $0x1
    2c9d:	e8 8e 0d 00 00       	call   3a30 <printf>
      exit();
    2ca2:	e8 3b 0c 00 00       	call   38e2 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2ca7:	83 ec 08             	sub    $0x8,%esp
    2caa:	68 d8 4a 00 00       	push   $0x4ad8
    2caf:	6a 01                	push   $0x1
    2cb1:	e8 7a 0d 00 00       	call   3a30 <printf>
      exit();
    2cb6:	e8 27 0c 00 00       	call   38e2 <exit>
    2cbb:	90                   	nop
    2cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002cc0 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2cc0:	55                   	push   %ebp
    2cc1:	89 e5                	mov    %esp,%ebp
    2cc3:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2cc4:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2cc6:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2cc9:	68 00 4b 00 00       	push   $0x4b00
    2cce:	6a 01                	push   $0x1
    2cd0:	e8 5b 0d 00 00       	call   3a30 <printf>
    2cd5:	83 c4 10             	add    $0x10,%esp
    2cd8:	eb 13                	jmp    2ced <forktest+0x2d>
    2cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork(0);
    if(pid < 0)
      break;
    if(pid == 0)
    2ce0:	74 6a                	je     2d4c <forktest+0x8c>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2ce2:	83 c3 01             	add    $0x1,%ebx
    2ce5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2ceb:	74 4b                	je     2d38 <forktest+0x78>
    pid = fork(0);
    2ced:	83 ec 0c             	sub    $0xc,%esp
    2cf0:	6a 00                	push   $0x0
    2cf2:	e8 e3 0b 00 00       	call   38da <fork>
    if(pid < 0)
    2cf7:	83 c4 10             	add    $0x10,%esp
    2cfa:	85 c0                	test   %eax,%eax
    2cfc:	79 e2                	jns    2ce0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cfe:	85 db                	test   %ebx,%ebx
    2d00:	74 14                	je     2d16 <forktest+0x56>
    2d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2d08:	e8 dd 0b 00 00       	call   38ea <wait>
    2d0d:	85 c0                	test   %eax,%eax
    2d0f:	78 40                	js     2d51 <forktest+0x91>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2d11:	83 eb 01             	sub    $0x1,%ebx
    2d14:	75 f2                	jne    2d08 <forktest+0x48>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2d16:	e8 cf 0b 00 00       	call   38ea <wait>
    2d1b:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d1e:	75 45                	jne    2d65 <forktest+0xa5>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2d20:	83 ec 08             	sub    $0x8,%esp
    2d23:	68 32 4b 00 00       	push   $0x4b32
    2d28:	6a 01                	push   $0x1
    2d2a:	e8 01 0d 00 00       	call   3a30 <printf>
}
    2d2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d32:	c9                   	leave  
    2d33:	c3                   	ret    
    2d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2d38:	83 ec 08             	sub    $0x8,%esp
    2d3b:	68 7c 52 00 00       	push   $0x527c
    2d40:	6a 01                	push   $0x1
    2d42:	e8 e9 0c 00 00       	call   3a30 <printf>
    exit();
    2d47:	e8 96 0b 00 00       	call   38e2 <exit>
  for(n=0; n<1000; n++){
    pid = fork(0);
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2d4c:	e8 91 0b 00 00       	call   38e2 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2d51:	83 ec 08             	sub    $0x8,%esp
    2d54:	68 0b 4b 00 00       	push   $0x4b0b
    2d59:	6a 01                	push   $0x1
    2d5b:	e8 d0 0c 00 00       	call   3a30 <printf>
      exit();
    2d60:	e8 7d 0b 00 00       	call   38e2 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2d65:	83 ec 08             	sub    $0x8,%esp
    2d68:	68 1f 4b 00 00       	push   $0x4b1f
    2d6d:	6a 01                	push   $0x1
    2d6f:	e8 bc 0c 00 00       	call   3a30 <printf>
    exit();
    2d74:	e8 69 0b 00 00       	call   38e2 <exit>
    2d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002d80 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d80:	55                   	push   %ebp
    2d81:	89 e5                	mov    %esp,%ebp
    2d83:	57                   	push   %edi
    2d84:	56                   	push   %esi
    2d85:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d86:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d88:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d8b:	68 40 4b 00 00       	push   $0x4b40
    2d90:	ff 35 98 5d 00 00    	pushl  0x5d98
    2d96:	e8 95 0c 00 00       	call   3a30 <printf>
  oldbrk = sbrk(0);
    2d9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2da2:	e8 c3 0b 00 00       	call   396a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2da7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2dae:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2db1:	e8 b4 0b 00 00       	call   396a <sbrk>
    2db6:	83 c4 10             	add    $0x10,%esp
    2db9:	89 c3                	mov    %eax,%ebx
    2dbb:	90                   	nop
    2dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2dc0:	83 ec 0c             	sub    $0xc,%esp
    2dc3:	6a 01                	push   $0x1
    2dc5:	e8 a0 0b 00 00       	call   396a <sbrk>
    if(b != a){
    2dca:	83 c4 10             	add    $0x10,%esp
    2dcd:	39 d8                	cmp    %ebx,%eax
    2dcf:	0f 85 9d 02 00 00    	jne    3072 <sbrktest+0x2f2>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2dd5:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2dd8:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2ddb:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2dde:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2de4:	75 da                	jne    2dc0 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork(0);
    2de6:	83 ec 0c             	sub    $0xc,%esp
    2de9:	6a 00                	push   $0x0
    2deb:	e8 ea 0a 00 00       	call   38da <fork>
  if(pid < 0){
    2df0:	83 c4 10             	add    $0x10,%esp
    2df3:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork(0);
    2df5:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2df7:	0f 88 a3 03 00 00    	js     31a0 <sbrktest+0x420>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2dfd:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2e00:	83 c3 01             	add    $0x1,%ebx
  pid = fork(0);
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2e03:	6a 01                	push   $0x1
    2e05:	e8 60 0b 00 00       	call   396a <sbrk>
  c = sbrk(1);
    2e0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e11:	e8 54 0b 00 00       	call   396a <sbrk>
  if(c != a + 1){
    2e16:	83 c4 10             	add    $0x10,%esp
    2e19:	39 d8                	cmp    %ebx,%eax
    2e1b:	0f 85 67 03 00 00    	jne    3188 <sbrktest+0x408>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2e21:	85 ff                	test   %edi,%edi
    2e23:	0f 84 5a 03 00 00    	je     3183 <sbrktest+0x403>
    exit();
  wait();
    2e29:	e8 bc 0a 00 00       	call   38ea <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2e2e:	83 ec 0c             	sub    $0xc,%esp
    2e31:	6a 00                	push   $0x0
    2e33:	e8 32 0b 00 00       	call   396a <sbrk>
    2e38:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    2e3a:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e3f:	29 d8                	sub    %ebx,%eax
    2e41:	89 04 24             	mov    %eax,(%esp)
    2e44:	e8 21 0b 00 00       	call   396a <sbrk>
  if (p != a) {
    2e49:	83 c4 10             	add    $0x10,%esp
    2e4c:	39 c3                	cmp    %eax,%ebx
    2e4e:	0f 85 17 03 00 00    	jne    316b <sbrktest+0x3eb>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e54:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2e57:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2e5e:	6a 00                	push   $0x0
    2e60:	e8 05 0b 00 00       	call   396a <sbrk>
  c = sbrk(-4096);
    2e65:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e6c:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e6e:	e8 f7 0a 00 00       	call   396a <sbrk>
  if(c == (char*)0xffffffff){
    2e73:	83 c4 10             	add    $0x10,%esp
    2e76:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e79:	0f 84 d4 02 00 00    	je     3153 <sbrktest+0x3d3>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e7f:	83 ec 0c             	sub    $0xc,%esp
    2e82:	6a 00                	push   $0x0
    2e84:	e8 e1 0a 00 00       	call   396a <sbrk>
  if(c != a - 4096){
    2e89:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e8f:	83 c4 10             	add    $0x10,%esp
    2e92:	39 d0                	cmp    %edx,%eax
    2e94:	0f 85 a2 02 00 00    	jne    313c <sbrktest+0x3bc>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e9a:	83 ec 0c             	sub    $0xc,%esp
    2e9d:	6a 00                	push   $0x0
    2e9f:	e8 c6 0a 00 00       	call   396a <sbrk>
    2ea4:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2ea6:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2ead:	e8 b8 0a 00 00       	call   396a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2eb2:	83 c4 10             	add    $0x10,%esp
    2eb5:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2eb7:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2eb9:	0f 85 66 02 00 00    	jne    3125 <sbrktest+0x3a5>
    2ebf:	83 ec 0c             	sub    $0xc,%esp
    2ec2:	6a 00                	push   $0x0
    2ec4:	e8 a1 0a 00 00       	call   396a <sbrk>
    2ec9:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2ecf:	83 c4 10             	add    $0x10,%esp
    2ed2:	39 d0                	cmp    %edx,%eax
    2ed4:	0f 85 4b 02 00 00    	jne    3125 <sbrktest+0x3a5>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2eda:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2ee1:	0f 84 26 02 00 00    	je     310d <sbrktest+0x38d>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2ee7:	83 ec 0c             	sub    $0xc,%esp
    2eea:	6a 00                	push   $0x0
    2eec:	e8 79 0a 00 00       	call   396a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2ef1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2ef8:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2efa:	e8 6b 0a 00 00       	call   396a <sbrk>
    2eff:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2f02:	29 c1                	sub    %eax,%ecx
    2f04:	89 0c 24             	mov    %ecx,(%esp)
    2f07:	e8 5e 0a 00 00       	call   396a <sbrk>
  if(c != a){
    2f0c:	83 c4 10             	add    $0x10,%esp
    2f0f:	39 c3                	cmp    %eax,%ebx
    2f11:	0f 85 df 01 00 00    	jne    30f6 <sbrktest+0x376>
    2f17:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2f20:	e8 3d 0a 00 00       	call   3962 <getpid>
    pid = fork(0);
    2f25:	83 ec 0c             	sub    $0xc,%esp
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2f28:	89 c7                	mov    %eax,%edi
    pid = fork(0);
    2f2a:	6a 00                	push   $0x0
    2f2c:	e8 a9 09 00 00       	call   38da <fork>
    if(pid < 0){
    2f31:	83 c4 10             	add    $0x10,%esp
    2f34:	85 c0                	test   %eax,%eax
    2f36:	0f 88 a2 01 00 00    	js     30de <sbrktest+0x35e>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2f3c:	0f 84 7a 01 00 00    	je     30bc <sbrktest+0x33c>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f42:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2f48:	e8 9d 09 00 00       	call   38ea <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f4d:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f53:	75 cb                	jne    2f20 <sbrktest+0x1a0>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2f55:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f58:	83 ec 0c             	sub    $0xc,%esp
    2f5b:	50                   	push   %eax
    2f5c:	e8 91 09 00 00       	call   38f2 <pipe>
    2f61:	83 c4 10             	add    $0x10,%esp
    2f64:	85 c0                	test   %eax,%eax
    2f66:	0f 85 3c 01 00 00    	jne    30a8 <sbrktest+0x328>
    2f6c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2f6f:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2f72:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork(0)) == 0){
    2f74:	83 ec 0c             	sub    $0xc,%esp
    2f77:	6a 00                	push   $0x0
    2f79:	e8 5c 09 00 00       	call   38da <fork>
    2f7e:	83 c4 10             	add    $0x10,%esp
    2f81:	85 c0                	test   %eax,%eax
    2f83:	89 06                	mov    %eax,(%esi)
    2f85:	0f 84 a1 00 00 00    	je     302c <sbrktest+0x2ac>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f8b:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f8e:	74 14                	je     2fa4 <sbrktest+0x224>
      read(fds[0], &scratch, 1);
    2f90:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f93:	83 ec 04             	sub    $0x4,%esp
    2f96:	6a 01                	push   $0x1
    2f98:	50                   	push   %eax
    2f99:	ff 75 b8             	pushl  -0x48(%ebp)
    2f9c:	e8 59 09 00 00       	call   38fa <read>
    2fa1:	83 c4 10             	add    $0x10,%esp
    2fa4:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fa7:	39 f7                	cmp    %esi,%edi
    2fa9:	75 c9                	jne    2f74 <sbrktest+0x1f4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2fab:	83 ec 0c             	sub    $0xc,%esp
    2fae:	68 00 10 00 00       	push   $0x1000
    2fb3:	e8 b2 09 00 00       	call   396a <sbrk>
    2fb8:	83 c4 10             	add    $0x10,%esp
    2fbb:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2fbd:	8b 03                	mov    (%ebx),%eax
    2fbf:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fc2:	74 11                	je     2fd5 <sbrktest+0x255>
      continue;
    kill(pids[i]);
    2fc4:	83 ec 0c             	sub    $0xc,%esp
    2fc7:	50                   	push   %eax
    2fc8:	e8 45 09 00 00       	call   3912 <kill>
    wait();
    2fcd:	e8 18 09 00 00       	call   38ea <wait>
    2fd2:	83 c4 10             	add    $0x10,%esp
    2fd5:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fd8:	39 fb                	cmp    %edi,%ebx
    2fda:	75 e1                	jne    2fbd <sbrktest+0x23d>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2fdc:	83 fe ff             	cmp    $0xffffffff,%esi
    2fdf:	0f 84 ab 00 00 00    	je     3090 <sbrktest+0x310>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2fe5:	83 ec 0c             	sub    $0xc,%esp
    2fe8:	6a 00                	push   $0x0
    2fea:	e8 7b 09 00 00       	call   396a <sbrk>
    2fef:	83 c4 10             	add    $0x10,%esp
    2ff2:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2ff5:	73 1a                	jae    3011 <sbrktest+0x291>
    sbrk(-(sbrk(0) - oldbrk));
    2ff7:	83 ec 0c             	sub    $0xc,%esp
    2ffa:	6a 00                	push   $0x0
    2ffc:	e8 69 09 00 00       	call   396a <sbrk>
    3001:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    3004:	29 c6                	sub    %eax,%esi
    3006:	89 34 24             	mov    %esi,(%esp)
    3009:	e8 5c 09 00 00       	call   396a <sbrk>
    300e:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    3011:	83 ec 08             	sub    $0x8,%esp
    3014:	68 e8 4b 00 00       	push   $0x4be8
    3019:	ff 35 98 5d 00 00    	pushl  0x5d98
    301f:	e8 0c 0a 00 00       	call   3a30 <printf>
}
    3024:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3027:	5b                   	pop    %ebx
    3028:	5e                   	pop    %esi
    3029:	5f                   	pop    %edi
    302a:	5d                   	pop    %ebp
    302b:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork(0)) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    302c:	83 ec 0c             	sub    $0xc,%esp
    302f:	6a 00                	push   $0x0
    3031:	e8 34 09 00 00       	call   396a <sbrk>
    3036:	ba 00 00 40 06       	mov    $0x6400000,%edx
    303b:	29 c2                	sub    %eax,%edx
    303d:	89 14 24             	mov    %edx,(%esp)
    3040:	e8 25 09 00 00       	call   396a <sbrk>
      write(fds[1], "x", 1);
    3045:	83 c4 0c             	add    $0xc,%esp
    3048:	6a 01                	push   $0x1
    304a:	68 a9 46 00 00       	push   $0x46a9
    304f:	ff 75 bc             	pushl  -0x44(%ebp)
    3052:	e8 ab 08 00 00       	call   3902 <write>
    3057:	83 c4 10             	add    $0x10,%esp
    305a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3060:	83 ec 0c             	sub    $0xc,%esp
    3063:	68 e8 03 00 00       	push   $0x3e8
    3068:	e8 05 09 00 00       	call   3972 <sleep>
    306d:	83 c4 10             	add    $0x10,%esp
    3070:	eb ee                	jmp    3060 <sbrktest+0x2e0>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3072:	83 ec 0c             	sub    $0xc,%esp
    3075:	50                   	push   %eax
    3076:	53                   	push   %ebx
    3077:	57                   	push   %edi
    3078:	68 4b 4b 00 00       	push   $0x4b4b
    307d:	ff 35 98 5d 00 00    	pushl  0x5d98
    3083:	e8 a8 09 00 00       	call   3a30 <printf>
      exit();
    3088:	83 c4 20             	add    $0x20,%esp
    308b:	e8 52 08 00 00       	call   38e2 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3090:	83 ec 08             	sub    $0x8,%esp
    3093:	68 cd 4b 00 00       	push   $0x4bcd
    3098:	ff 35 98 5d 00 00    	pushl  0x5d98
    309e:	e8 8d 09 00 00       	call   3a30 <printf>
    exit();
    30a3:	e8 3a 08 00 00       	call   38e2 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    30a8:	83 ec 08             	sub    $0x8,%esp
    30ab:	68 89 40 00 00       	push   $0x4089
    30b0:	6a 01                	push   $0x1
    30b2:	e8 79 09 00 00       	call   3a30 <printf>
    exit();
    30b7:	e8 26 08 00 00       	call   38e2 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    30bc:	0f be 03             	movsbl (%ebx),%eax
    30bf:	50                   	push   %eax
    30c0:	53                   	push   %ebx
    30c1:	68 b4 4b 00 00       	push   $0x4bb4
    30c6:	ff 35 98 5d 00 00    	pushl  0x5d98
    30cc:	e8 5f 09 00 00       	call   3a30 <printf>
      kill(ppid);
    30d1:	89 3c 24             	mov    %edi,(%esp)
    30d4:	e8 39 08 00 00       	call   3912 <kill>
      exit();
    30d9:	e8 04 08 00 00       	call   38e2 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork(0);
    if(pid < 0){
      printf(stdout, "fork failed\n");
    30de:	83 ec 08             	sub    $0x8,%esp
    30e1:	68 91 4c 00 00       	push   $0x4c91
    30e6:	ff 35 98 5d 00 00    	pushl  0x5d98
    30ec:	e8 3f 09 00 00       	call   3a30 <printf>
      exit();
    30f1:	e8 ec 07 00 00       	call   38e2 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30f6:	50                   	push   %eax
    30f7:	53                   	push   %ebx
    30f8:	68 70 53 00 00       	push   $0x5370
    30fd:	ff 35 98 5d 00 00    	pushl  0x5d98
    3103:	e8 28 09 00 00       	call   3a30 <printf>
    exit();
    3108:	e8 d5 07 00 00       	call   38e2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    310d:	83 ec 08             	sub    $0x8,%esp
    3110:	68 40 53 00 00       	push   $0x5340
    3115:	ff 35 98 5d 00 00    	pushl  0x5d98
    311b:	e8 10 09 00 00       	call   3a30 <printf>
    exit();
    3120:	e8 bd 07 00 00       	call   38e2 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3125:	57                   	push   %edi
    3126:	53                   	push   %ebx
    3127:	68 18 53 00 00       	push   $0x5318
    312c:	ff 35 98 5d 00 00    	pushl  0x5d98
    3132:	e8 f9 08 00 00       	call   3a30 <printf>
    exit();
    3137:	e8 a6 07 00 00       	call   38e2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    313c:	50                   	push   %eax
    313d:	53                   	push   %ebx
    313e:	68 e0 52 00 00       	push   $0x52e0
    3143:	ff 35 98 5d 00 00    	pushl  0x5d98
    3149:	e8 e2 08 00 00       	call   3a30 <printf>
    exit();
    314e:	e8 8f 07 00 00       	call   38e2 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    3153:	83 ec 08             	sub    $0x8,%esp
    3156:	68 99 4b 00 00       	push   $0x4b99
    315b:	ff 35 98 5d 00 00    	pushl  0x5d98
    3161:	e8 ca 08 00 00       	call   3a30 <printf>
    exit();
    3166:	e8 77 07 00 00       	call   38e2 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    316b:	83 ec 08             	sub    $0x8,%esp
    316e:	68 a0 52 00 00       	push   $0x52a0
    3173:	ff 35 98 5d 00 00    	pushl  0x5d98
    3179:	e8 b2 08 00 00       	call   3a30 <printf>
    exit();
    317e:	e8 5f 07 00 00       	call   38e2 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    3183:	e8 5a 07 00 00       	call   38e2 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3188:	83 ec 08             	sub    $0x8,%esp
    318b:	68 7d 4b 00 00       	push   $0x4b7d
    3190:	ff 35 98 5d 00 00    	pushl  0x5d98
    3196:	e8 95 08 00 00       	call   3a30 <printf>
    exit();
    319b:	e8 42 07 00 00       	call   38e2 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork(0);
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    31a0:	83 ec 08             	sub    $0x8,%esp
    31a3:	68 66 4b 00 00       	push   $0x4b66
    31a8:	ff 35 98 5d 00 00    	pushl  0x5d98
    31ae:	e8 7d 08 00 00       	call   3a30 <printf>
    exit();
    31b3:	e8 2a 07 00 00       	call   38e2 <exit>
    31b8:	90                   	nop
    31b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000031c0 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    31c0:	55                   	push   %ebp
    31c1:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    31c3:	5d                   	pop    %ebp
    31c4:	c3                   	ret    
    31c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    31c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000031d0 <validatetest>:

void
validatetest(void)
{
    31d0:	55                   	push   %ebp
    31d1:	89 e5                	mov    %esp,%ebp
    31d3:	56                   	push   %esi
    31d4:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31d5:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    31d7:	83 ec 08             	sub    $0x8,%esp
    31da:	68 f6 4b 00 00       	push   $0x4bf6
    31df:	ff 35 98 5d 00 00    	pushl  0x5d98
    31e5:	e8 46 08 00 00       	call   3a30 <printf>
    31ea:	83 c4 10             	add    $0x10,%esp
    31ed:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork(0)) == 0){
    31f0:	83 ec 0c             	sub    $0xc,%esp
    31f3:	6a 00                	push   $0x0
    31f5:	e8 e0 06 00 00       	call   38da <fork>
    31fa:	83 c4 10             	add    $0x10,%esp
    31fd:	85 c0                	test   %eax,%eax
    31ff:	89 c6                	mov    %eax,%esi
    3201:	74 63                	je     3266 <validatetest+0x96>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    3203:	83 ec 0c             	sub    $0xc,%esp
    3206:	6a 00                	push   $0x0
    3208:	e8 65 07 00 00       	call   3972 <sleep>
    sleep(0);
    320d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3214:	e8 59 07 00 00       	call   3972 <sleep>
    kill(pid);
    3219:	89 34 24             	mov    %esi,(%esp)
    321c:	e8 f1 06 00 00       	call   3912 <kill>
    wait();
    3221:	e8 c4 06 00 00       	call   38ea <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3226:	58                   	pop    %eax
    3227:	5a                   	pop    %edx
    3228:	53                   	push   %ebx
    3229:	68 05 4c 00 00       	push   $0x4c05
    322e:	e8 0f 07 00 00       	call   3942 <link>
    3233:	83 c4 10             	add    $0x10,%esp
    3236:	83 f8 ff             	cmp    $0xffffffff,%eax
    3239:	75 30                	jne    326b <validatetest+0x9b>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    323b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3241:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3247:	75 a7                	jne    31f0 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3249:	83 ec 08             	sub    $0x8,%esp
    324c:	68 29 4c 00 00       	push   $0x4c29
    3251:	ff 35 98 5d 00 00    	pushl  0x5d98
    3257:	e8 d4 07 00 00       	call   3a30 <printf>
}
    325c:	83 c4 10             	add    $0x10,%esp
    325f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3262:	5b                   	pop    %ebx
    3263:	5e                   	pop    %esi
    3264:	5d                   	pop    %ebp
    3265:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork(0)) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    3266:	e8 77 06 00 00       	call   38e2 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    326b:	83 ec 08             	sub    $0x8,%esp
    326e:	68 10 4c 00 00       	push   $0x4c10
    3273:	ff 35 98 5d 00 00    	pushl  0x5d98
    3279:	e8 b2 07 00 00       	call   3a30 <printf>
      exit();
    327e:	e8 5f 06 00 00       	call   38e2 <exit>
    3283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003290 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3290:	55                   	push   %ebp
    3291:	89 e5                	mov    %esp,%ebp
    3293:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3296:	68 36 4c 00 00       	push   $0x4c36
    329b:	ff 35 98 5d 00 00    	pushl  0x5d98
    32a1:	e8 8a 07 00 00       	call   3a30 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    32a6:	83 c4 10             	add    $0x10,%esp
    32a9:	80 3d 60 5e 00 00 00 	cmpb   $0x0,0x5e60
    32b0:	75 35                	jne    32e7 <bsstest+0x57>
    32b2:	b8 61 5e 00 00       	mov    $0x5e61,%eax
    32b7:	89 f6                	mov    %esi,%esi
    32b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    32c0:	80 38 00             	cmpb   $0x0,(%eax)
    32c3:	75 22                	jne    32e7 <bsstest+0x57>
    32c5:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    32c8:	3d 70 85 00 00       	cmp    $0x8570,%eax
    32cd:	75 f1                	jne    32c0 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    32cf:	83 ec 08             	sub    $0x8,%esp
    32d2:	68 51 4c 00 00       	push   $0x4c51
    32d7:	ff 35 98 5d 00 00    	pushl  0x5d98
    32dd:	e8 4e 07 00 00       	call   3a30 <printf>
}
    32e2:	83 c4 10             	add    $0x10,%esp
    32e5:	c9                   	leave  
    32e6:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    32e7:	83 ec 08             	sub    $0x8,%esp
    32ea:	68 40 4c 00 00       	push   $0x4c40
    32ef:	ff 35 98 5d 00 00    	pushl  0x5d98
    32f5:	e8 36 07 00 00       	call   3a30 <printf>
      exit();
    32fa:	e8 e3 05 00 00       	call   38e2 <exit>
    32ff:	90                   	nop

00003300 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3300:	55                   	push   %ebp
    3301:	89 e5                	mov    %esp,%ebp
    3303:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3306:	68 5e 4c 00 00       	push   $0x4c5e
    330b:	e8 22 06 00 00       	call   3932 <unlink>
  pid = fork(0);
    3310:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3317:	e8 be 05 00 00       	call   38da <fork>
  if(pid == 0){
    331c:	83 c4 10             	add    $0x10,%esp
    331f:	85 c0                	test   %eax,%eax
    3321:	74 3f                	je     3362 <bigargtest+0x62>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    3323:	0f 88 cb 00 00 00    	js     33f4 <bigargtest+0xf4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3329:	e8 bc 05 00 00       	call   38ea <wait>
  fd = open("bigarg-ok", 0);
    332e:	83 ec 08             	sub    $0x8,%esp
    3331:	6a 00                	push   $0x0
    3333:	68 5e 4c 00 00       	push   $0x4c5e
    3338:	e8 e5 05 00 00       	call   3922 <open>
  if(fd < 0){
    333d:	83 c4 10             	add    $0x10,%esp
    3340:	85 c0                	test   %eax,%eax
    3342:	0f 88 95 00 00 00    	js     33dd <bigargtest+0xdd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    3348:	83 ec 0c             	sub    $0xc,%esp
    334b:	50                   	push   %eax
    334c:	e8 b9 05 00 00       	call   390a <close>
  unlink("bigarg-ok");
    3351:	c7 04 24 5e 4c 00 00 	movl   $0x4c5e,(%esp)
    3358:	e8 d5 05 00 00       	call   3932 <unlink>
}
    335d:	83 c4 10             	add    $0x10,%esp
    3360:	c9                   	leave  
    3361:	c3                   	ret    
    3362:	b8 c0 5d 00 00       	mov    $0x5dc0,%eax
    3367:	89 f6                	mov    %esi,%esi
    3369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  pid = fork(0);
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3370:	c7 00 94 53 00 00    	movl   $0x5394,(%eax)
    3376:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork(0);
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3379:	3d 3c 5e 00 00       	cmp    $0x5e3c,%eax
    337e:	75 f0                	jne    3370 <bigargtest+0x70>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3380:	51                   	push   %ecx
    3381:	51                   	push   %ecx
    3382:	68 68 4c 00 00       	push   $0x4c68
    3387:	ff 35 98 5d 00 00    	pushl  0x5d98
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    338d:	c7 05 3c 5e 00 00 00 	movl   $0x0,0x5e3c
    3394:	00 00 00 
    printf(stdout, "bigarg test\n");
    3397:	e8 94 06 00 00       	call   3a30 <printf>
    exec("echo", args);
    339c:	58                   	pop    %eax
    339d:	5a                   	pop    %edx
    339e:	68 c0 5d 00 00       	push   $0x5dc0
    33a3:	68 35 3e 00 00       	push   $0x3e35
    33a8:	e8 6d 05 00 00       	call   391a <exec>
    printf(stdout, "bigarg test ok\n");
    33ad:	59                   	pop    %ecx
    33ae:	58                   	pop    %eax
    33af:	68 75 4c 00 00       	push   $0x4c75
    33b4:	ff 35 98 5d 00 00    	pushl  0x5d98
    33ba:	e8 71 06 00 00       	call   3a30 <printf>
    fd = open("bigarg-ok", O_CREATE);
    33bf:	58                   	pop    %eax
    33c0:	5a                   	pop    %edx
    33c1:	68 00 02 00 00       	push   $0x200
    33c6:	68 5e 4c 00 00       	push   $0x4c5e
    33cb:	e8 52 05 00 00       	call   3922 <open>
    close(fd);
    33d0:	89 04 24             	mov    %eax,(%esp)
    33d3:	e8 32 05 00 00       	call   390a <close>
    exit();
    33d8:	e8 05 05 00 00       	call   38e2 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    33dd:	50                   	push   %eax
    33de:	50                   	push   %eax
    33df:	68 9e 4c 00 00       	push   $0x4c9e
    33e4:	ff 35 98 5d 00 00    	pushl  0x5d98
    33ea:	e8 41 06 00 00       	call   3a30 <printf>
    exit();
    33ef:	e8 ee 04 00 00       	call   38e2 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    33f4:	52                   	push   %edx
    33f5:	52                   	push   %edx
    33f6:	68 85 4c 00 00       	push   $0x4c85
    33fb:	ff 35 98 5d 00 00    	pushl  0x5d98
    3401:	e8 2a 06 00 00       	call   3a30 <printf>
    exit();
    3406:	e8 d7 04 00 00       	call   38e2 <exit>
    340b:	90                   	nop
    340c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003410 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3410:	55                   	push   %ebp
    3411:	89 e5                	mov    %esp,%ebp
    3413:	57                   	push   %edi
    3414:	56                   	push   %esi
    3415:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3416:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3418:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    341b:	68 b3 4c 00 00       	push   $0x4cb3
    3420:	6a 01                	push   $0x1
    3422:	e8 09 06 00 00       	call   3a30 <printf>
    3427:	83 c4 10             	add    $0x10,%esp
    342a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3430:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3435:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3437:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3439:	f7 eb                	imul   %ebx
    343b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    343e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3440:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3443:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3447:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    344b:	c1 fa 06             	sar    $0x6,%edx
    344e:	29 f2                	sub    %esi,%edx
    3450:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3453:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3459:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    345c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3461:	29 d1                	sub    %edx,%ecx
    3463:	f7 e9                	imul   %ecx
    3465:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3468:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    346d:	c1 fa 05             	sar    $0x5,%edx
    3470:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    3472:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3477:	83 c2 30             	add    $0x30,%edx
    347a:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    347d:	f7 eb                	imul   %ebx
    347f:	c1 fa 05             	sar    $0x5,%edx
    3482:	29 f2                	sub    %esi,%edx
    3484:	6b d2 64             	imul   $0x64,%edx,%edx
    3487:	29 d7                	sub    %edx,%edi
    3489:	89 f8                	mov    %edi,%eax
    348b:	c1 ff 1f             	sar    $0x1f,%edi
    348e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3490:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3492:	c1 fa 02             	sar    $0x2,%edx
    3495:	29 fa                	sub    %edi,%edx
    3497:	83 c2 30             	add    $0x30,%edx
    349a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    349d:	f7 e9                	imul   %ecx
    349f:	89 d9                	mov    %ebx,%ecx
    34a1:	c1 fa 02             	sar    $0x2,%edx
    34a4:	29 f2                	sub    %esi,%edx
    34a6:	8d 04 92             	lea    (%edx,%edx,4),%eax
    34a9:	01 c0                	add    %eax,%eax
    34ab:	29 c1                	sub    %eax,%ecx
    34ad:	89 c8                	mov    %ecx,%eax
    34af:	83 c0 30             	add    $0x30,%eax
    34b2:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    34b5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34b8:	50                   	push   %eax
    34b9:	68 c0 4c 00 00       	push   $0x4cc0
    34be:	6a 01                	push   $0x1
    34c0:	e8 6b 05 00 00       	call   3a30 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    34c5:	58                   	pop    %eax
    34c6:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34c9:	5a                   	pop    %edx
    34ca:	68 02 02 00 00       	push   $0x202
    34cf:	50                   	push   %eax
    34d0:	e8 4d 04 00 00       	call   3922 <open>
    if(fd < 0){
    34d5:	83 c4 10             	add    $0x10,%esp
    34d8:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    34da:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    34dc:	78 50                	js     352e <fsfull+0x11e>
    34de:	31 f6                	xor    %esi,%esi
    34e0:	eb 08                	jmp    34ea <fsfull+0xda>
    34e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    34e8:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    34ea:	83 ec 04             	sub    $0x4,%esp
    34ed:	68 00 02 00 00       	push   $0x200
    34f2:	68 80 85 00 00       	push   $0x8580
    34f7:	57                   	push   %edi
    34f8:	e8 05 04 00 00       	call   3902 <write>
      if(cc < 512)
    34fd:	83 c4 10             	add    $0x10,%esp
    3500:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3505:	7f e1                	jg     34e8 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3507:	83 ec 04             	sub    $0x4,%esp
    350a:	56                   	push   %esi
    350b:	68 dc 4c 00 00       	push   $0x4cdc
    3510:	6a 01                	push   $0x1
    3512:	e8 19 05 00 00       	call   3a30 <printf>
    close(fd);
    3517:	89 3c 24             	mov    %edi,(%esp)
    351a:	e8 eb 03 00 00       	call   390a <close>
    if(total == 0)
    351f:	83 c4 10             	add    $0x10,%esp
    3522:	85 f6                	test   %esi,%esi
    3524:	74 22                	je     3548 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3526:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3529:	e9 02 ff ff ff       	jmp    3430 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    352e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3531:	83 ec 04             	sub    $0x4,%esp
    3534:	50                   	push   %eax
    3535:	68 cc 4c 00 00       	push   $0x4ccc
    353a:	6a 01                	push   $0x1
    353c:	e8 ef 04 00 00       	call   3a30 <printf>
      break;
    3541:	83 c4 10             	add    $0x10,%esp
    3544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3548:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    354d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    354f:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3551:	f7 eb                	imul   %ebx
    3553:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3556:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    3558:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    355b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    355f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3563:	c1 fa 06             	sar    $0x6,%edx
    3566:	29 f2                	sub    %esi,%edx
    3568:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    356b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3571:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3574:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3579:	29 d1                	sub    %edx,%ecx
    357b:	f7 e9                	imul   %ecx
    357d:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3580:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3585:	c1 fa 05             	sar    $0x5,%edx
    3588:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    358a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    358f:	83 c2 30             	add    $0x30,%edx
    3592:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3595:	f7 eb                	imul   %ebx
    3597:	c1 fa 05             	sar    $0x5,%edx
    359a:	29 f2                	sub    %esi,%edx
    359c:	6b d2 64             	imul   $0x64,%edx,%edx
    359f:	29 d7                	sub    %edx,%edi
    35a1:	89 f8                	mov    %edi,%eax
    35a3:	c1 ff 1f             	sar    $0x1f,%edi
    35a6:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    35a8:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    35aa:	c1 fa 02             	sar    $0x2,%edx
    35ad:	29 fa                	sub    %edi,%edx
    35af:	83 c2 30             	add    $0x30,%edx
    35b2:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    35b5:	f7 e9                	imul   %ecx
    35b7:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    35b9:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    35bc:	c1 fa 02             	sar    $0x2,%edx
    35bf:	29 f2                	sub    %esi,%edx
    35c1:	8d 04 92             	lea    (%edx,%edx,4),%eax
    35c4:	01 c0                	add    %eax,%eax
    35c6:	29 c1                	sub    %eax,%ecx
    35c8:	89 c8                	mov    %ecx,%eax
    35ca:	83 c0 30             	add    $0x30,%eax
    35cd:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    35d0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    35d3:	50                   	push   %eax
    35d4:	e8 59 03 00 00       	call   3932 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    35d9:	83 c4 10             	add    $0x10,%esp
    35dc:	83 fb ff             	cmp    $0xffffffff,%ebx
    35df:	0f 85 63 ff ff ff    	jne    3548 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    35e5:	83 ec 08             	sub    $0x8,%esp
    35e8:	68 ec 4c 00 00       	push   $0x4cec
    35ed:	6a 01                	push   $0x1
    35ef:	e8 3c 04 00 00       	call   3a30 <printf>
}
    35f4:	83 c4 10             	add    $0x10,%esp
    35f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    35fa:	5b                   	pop    %ebx
    35fb:	5e                   	pop    %esi
    35fc:	5f                   	pop    %edi
    35fd:	5d                   	pop    %ebp
    35fe:	c3                   	ret    
    35ff:	90                   	nop

00003600 <uio>:

void
uio()
{
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3606:	68 02 4d 00 00       	push   $0x4d02
    360b:	6a 01                	push   $0x1
    360d:	e8 1e 04 00 00       	call   3a30 <printf>
  pid = fork(0);
    3612:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3619:	e8 bc 02 00 00       	call   38da <fork>
  if(pid == 0){
    361e:	83 c4 10             	add    $0x10,%esp
    3621:	85 c0                	test   %eax,%eax
    3623:	74 1b                	je     3640 <uio+0x40>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    3625:	78 3d                	js     3664 <uio+0x64>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3627:	e8 be 02 00 00       	call   38ea <wait>
  printf(1, "uio test done\n");
    362c:	83 ec 08             	sub    $0x8,%esp
    362f:	68 0c 4d 00 00       	push   $0x4d0c
    3634:	6a 01                	push   $0x1
    3636:	e8 f5 03 00 00       	call   3a30 <printf>
}
    363b:	83 c4 10             	add    $0x10,%esp
    363e:	c9                   	leave  
    363f:	c3                   	ret    
  pid = fork(0);
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3640:	ba 70 00 00 00       	mov    $0x70,%edx
    3645:	b8 09 00 00 00       	mov    $0x9,%eax
    364a:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    364b:	ba 71 00 00 00       	mov    $0x71,%edx
    3650:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    3651:	52                   	push   %edx
    3652:	52                   	push   %edx
    3653:	68 74 54 00 00       	push   $0x5474
    3658:	6a 01                	push   $0x1
    365a:	e8 d1 03 00 00       	call   3a30 <printf>
    exit();
    365f:	e8 7e 02 00 00       	call   38e2 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    3664:	50                   	push   %eax
    3665:	50                   	push   %eax
    3666:	68 91 4c 00 00       	push   $0x4c91
    366b:	6a 01                	push   $0x1
    366d:	e8 be 03 00 00       	call   3a30 <printf>
    exit();
    3672:	e8 6b 02 00 00       	call   38e2 <exit>
    3677:	89 f6                	mov    %esi,%esi
    3679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003680 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3680:	69 05 94 5d 00 00 0d 	imul   $0x19660d,0x5d94,%eax
    3687:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    368a:	55                   	push   %ebp
    368b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    368d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    368e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3693:	a3 94 5d 00 00       	mov    %eax,0x5d94
  return randstate;
}
    3698:	c3                   	ret    
    3699:	66 90                	xchg   %ax,%ax
    369b:	66 90                	xchg   %ax,%ax
    369d:	66 90                	xchg   %ax,%ax
    369f:	90                   	nop

000036a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	53                   	push   %ebx
    36a4:	8b 45 08             	mov    0x8(%ebp),%eax
    36a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    36aa:	89 c2                	mov    %eax,%edx
    36ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    36b0:	83 c1 01             	add    $0x1,%ecx
    36b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    36b7:	83 c2 01             	add    $0x1,%edx
    36ba:	84 db                	test   %bl,%bl
    36bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    36bf:	75 ef                	jne    36b0 <strcpy+0x10>
    ;
  return os;
}
    36c1:	5b                   	pop    %ebx
    36c2:	5d                   	pop    %ebp
    36c3:	c3                   	ret    
    36c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000036d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	56                   	push   %esi
    36d4:	53                   	push   %ebx
    36d5:	8b 55 08             	mov    0x8(%ebp),%edx
    36d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36db:	0f b6 02             	movzbl (%edx),%eax
    36de:	0f b6 19             	movzbl (%ecx),%ebx
    36e1:	84 c0                	test   %al,%al
    36e3:	75 1e                	jne    3703 <strcmp+0x33>
    36e5:	eb 29                	jmp    3710 <strcmp+0x40>
    36e7:	89 f6                	mov    %esi,%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    36f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    36f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    36fd:	84 c0                	test   %al,%al
    36ff:	74 0f                	je     3710 <strcmp+0x40>
    3701:	89 f1                	mov    %esi,%ecx
    3703:	38 d8                	cmp    %bl,%al
    3705:	74 e9                	je     36f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3707:	29 d8                	sub    %ebx,%eax
}
    3709:	5b                   	pop    %ebx
    370a:	5e                   	pop    %esi
    370b:	5d                   	pop    %ebp
    370c:	c3                   	ret    
    370d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3710:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3712:	29 d8                	sub    %ebx,%eax
}
    3714:	5b                   	pop    %ebx
    3715:	5e                   	pop    %esi
    3716:	5d                   	pop    %ebp
    3717:	c3                   	ret    
    3718:	90                   	nop
    3719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003720 <strlen>:

uint
strlen(char *s)
{
    3720:	55                   	push   %ebp
    3721:	89 e5                	mov    %esp,%ebp
    3723:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3726:	80 39 00             	cmpb   $0x0,(%ecx)
    3729:	74 12                	je     373d <strlen+0x1d>
    372b:	31 d2                	xor    %edx,%edx
    372d:	8d 76 00             	lea    0x0(%esi),%esi
    3730:	83 c2 01             	add    $0x1,%edx
    3733:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3737:	89 d0                	mov    %edx,%eax
    3739:	75 f5                	jne    3730 <strlen+0x10>
    ;
  return n;
}
    373b:	5d                   	pop    %ebp
    373c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    373d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    373f:	5d                   	pop    %ebp
    3740:	c3                   	ret    
    3741:	eb 0d                	jmp    3750 <memset>
    3743:	90                   	nop
    3744:	90                   	nop
    3745:	90                   	nop
    3746:	90                   	nop
    3747:	90                   	nop
    3748:	90                   	nop
    3749:	90                   	nop
    374a:	90                   	nop
    374b:	90                   	nop
    374c:	90                   	nop
    374d:	90                   	nop
    374e:	90                   	nop
    374f:	90                   	nop

00003750 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3750:	55                   	push   %ebp
    3751:	89 e5                	mov    %esp,%ebp
    3753:	57                   	push   %edi
    3754:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3757:	8b 4d 10             	mov    0x10(%ebp),%ecx
    375a:	8b 45 0c             	mov    0xc(%ebp),%eax
    375d:	89 d7                	mov    %edx,%edi
    375f:	fc                   	cld    
    3760:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3762:	89 d0                	mov    %edx,%eax
    3764:	5f                   	pop    %edi
    3765:	5d                   	pop    %ebp
    3766:	c3                   	ret    
    3767:	89 f6                	mov    %esi,%esi
    3769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003770 <strchr>:

char*
strchr(const char *s, char c)
{
    3770:	55                   	push   %ebp
    3771:	89 e5                	mov    %esp,%ebp
    3773:	53                   	push   %ebx
    3774:	8b 45 08             	mov    0x8(%ebp),%eax
    3777:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    377a:	0f b6 10             	movzbl (%eax),%edx
    377d:	84 d2                	test   %dl,%dl
    377f:	74 1d                	je     379e <strchr+0x2e>
    if(*s == c)
    3781:	38 d3                	cmp    %dl,%bl
    3783:	89 d9                	mov    %ebx,%ecx
    3785:	75 0d                	jne    3794 <strchr+0x24>
    3787:	eb 17                	jmp    37a0 <strchr+0x30>
    3789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3790:	38 ca                	cmp    %cl,%dl
    3792:	74 0c                	je     37a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3794:	83 c0 01             	add    $0x1,%eax
    3797:	0f b6 10             	movzbl (%eax),%edx
    379a:	84 d2                	test   %dl,%dl
    379c:	75 f2                	jne    3790 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    379e:	31 c0                	xor    %eax,%eax
}
    37a0:	5b                   	pop    %ebx
    37a1:	5d                   	pop    %ebp
    37a2:	c3                   	ret    
    37a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    37a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037b0 <gets>:

char*
gets(char *buf, int max)
{
    37b0:	55                   	push   %ebp
    37b1:	89 e5                	mov    %esp,%ebp
    37b3:	57                   	push   %edi
    37b4:	56                   	push   %esi
    37b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37b6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    37b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    37bb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37be:	eb 29                	jmp    37e9 <gets+0x39>
    cc = read(0, &c, 1);
    37c0:	83 ec 04             	sub    $0x4,%esp
    37c3:	6a 01                	push   $0x1
    37c5:	57                   	push   %edi
    37c6:	6a 00                	push   $0x0
    37c8:	e8 2d 01 00 00       	call   38fa <read>
    if(cc < 1)
    37cd:	83 c4 10             	add    $0x10,%esp
    37d0:	85 c0                	test   %eax,%eax
    37d2:	7e 1d                	jle    37f1 <gets+0x41>
      break;
    buf[i++] = c;
    37d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    37d8:	8b 55 08             	mov    0x8(%ebp),%edx
    37db:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    37dd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    37df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    37e3:	74 1b                	je     3800 <gets+0x50>
    37e5:	3c 0d                	cmp    $0xd,%al
    37e7:	74 17                	je     3800 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37e9:	8d 5e 01             	lea    0x1(%esi),%ebx
    37ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    37ef:	7c cf                	jl     37c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37f1:	8b 45 08             	mov    0x8(%ebp),%eax
    37f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    37f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37fb:	5b                   	pop    %ebx
    37fc:	5e                   	pop    %esi
    37fd:	5f                   	pop    %edi
    37fe:	5d                   	pop    %ebp
    37ff:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3800:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3803:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3805:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3809:	8d 65 f4             	lea    -0xc(%ebp),%esp
    380c:	5b                   	pop    %ebx
    380d:	5e                   	pop    %esi
    380e:	5f                   	pop    %edi
    380f:	5d                   	pop    %ebp
    3810:	c3                   	ret    
    3811:	eb 0d                	jmp    3820 <stat>
    3813:	90                   	nop
    3814:	90                   	nop
    3815:	90                   	nop
    3816:	90                   	nop
    3817:	90                   	nop
    3818:	90                   	nop
    3819:	90                   	nop
    381a:	90                   	nop
    381b:	90                   	nop
    381c:	90                   	nop
    381d:	90                   	nop
    381e:	90                   	nop
    381f:	90                   	nop

00003820 <stat>:

int
stat(char *n, struct stat *st)
{
    3820:	55                   	push   %ebp
    3821:	89 e5                	mov    %esp,%ebp
    3823:	56                   	push   %esi
    3824:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3825:	83 ec 08             	sub    $0x8,%esp
    3828:	6a 00                	push   $0x0
    382a:	ff 75 08             	pushl  0x8(%ebp)
    382d:	e8 f0 00 00 00       	call   3922 <open>
  if(fd < 0)
    3832:	83 c4 10             	add    $0x10,%esp
    3835:	85 c0                	test   %eax,%eax
    3837:	78 27                	js     3860 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3839:	83 ec 08             	sub    $0x8,%esp
    383c:	ff 75 0c             	pushl  0xc(%ebp)
    383f:	89 c3                	mov    %eax,%ebx
    3841:	50                   	push   %eax
    3842:	e8 f3 00 00 00       	call   393a <fstat>
    3847:	89 c6                	mov    %eax,%esi
  close(fd);
    3849:	89 1c 24             	mov    %ebx,(%esp)
    384c:	e8 b9 00 00 00       	call   390a <close>
  return r;
    3851:	83 c4 10             	add    $0x10,%esp
    3854:	89 f0                	mov    %esi,%eax
}
    3856:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3859:	5b                   	pop    %ebx
    385a:	5e                   	pop    %esi
    385b:	5d                   	pop    %ebp
    385c:	c3                   	ret    
    385d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3865:	eb ef                	jmp    3856 <stat+0x36>
    3867:	89 f6                	mov    %esi,%esi
    3869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003870 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3870:	55                   	push   %ebp
    3871:	89 e5                	mov    %esp,%ebp
    3873:	53                   	push   %ebx
    3874:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3877:	0f be 11             	movsbl (%ecx),%edx
    387a:	8d 42 d0             	lea    -0x30(%edx),%eax
    387d:	3c 09                	cmp    $0x9,%al
    387f:	b8 00 00 00 00       	mov    $0x0,%eax
    3884:	77 1f                	ja     38a5 <atoi+0x35>
    3886:	8d 76 00             	lea    0x0(%esi),%esi
    3889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3890:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3893:	83 c1 01             	add    $0x1,%ecx
    3896:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    389a:	0f be 11             	movsbl (%ecx),%edx
    389d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    38a0:	80 fb 09             	cmp    $0x9,%bl
    38a3:	76 eb                	jbe    3890 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    38a5:	5b                   	pop    %ebx
    38a6:	5d                   	pop    %ebp
    38a7:	c3                   	ret    
    38a8:	90                   	nop
    38a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000038b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    38b0:	55                   	push   %ebp
    38b1:	89 e5                	mov    %esp,%ebp
    38b3:	56                   	push   %esi
    38b4:	53                   	push   %ebx
    38b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    38b8:	8b 45 08             	mov    0x8(%ebp),%eax
    38bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38be:	85 db                	test   %ebx,%ebx
    38c0:	7e 14                	jle    38d6 <memmove+0x26>
    38c2:	31 d2                	xor    %edx,%edx
    38c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    38c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    38cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    38cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38d2:	39 da                	cmp    %ebx,%edx
    38d4:	75 f2                	jne    38c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    38d6:	5b                   	pop    %ebx
    38d7:	5e                   	pop    %esi
    38d8:	5d                   	pop    %ebp
    38d9:	c3                   	ret    

000038da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    38da:	b8 01 00 00 00       	mov    $0x1,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <exit>:
SYSCALL(exit)
    38e2:	b8 02 00 00 00       	mov    $0x2,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <wait>:
SYSCALL(wait)
    38ea:	b8 03 00 00 00       	mov    $0x3,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <pipe>:
SYSCALL(pipe)
    38f2:	b8 04 00 00 00       	mov    $0x4,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <read>:
SYSCALL(read)
    38fa:	b8 05 00 00 00       	mov    $0x5,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <write>:
SYSCALL(write)
    3902:	b8 10 00 00 00       	mov    $0x10,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <close>:
SYSCALL(close)
    390a:	b8 15 00 00 00       	mov    $0x15,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <kill>:
SYSCALL(kill)
    3912:	b8 06 00 00 00       	mov    $0x6,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <exec>:
SYSCALL(exec)
    391a:	b8 07 00 00 00       	mov    $0x7,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <open>:
SYSCALL(open)
    3922:	b8 0f 00 00 00       	mov    $0xf,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <mknod>:
SYSCALL(mknod)
    392a:	b8 11 00 00 00       	mov    $0x11,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <unlink>:
SYSCALL(unlink)
    3932:	b8 12 00 00 00       	mov    $0x12,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <fstat>:
SYSCALL(fstat)
    393a:	b8 08 00 00 00       	mov    $0x8,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <link>:
SYSCALL(link)
    3942:	b8 13 00 00 00       	mov    $0x13,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    

0000394a <mkdir>:
SYSCALL(mkdir)
    394a:	b8 14 00 00 00       	mov    $0x14,%eax
    394f:	cd 40                	int    $0x40
    3951:	c3                   	ret    

00003952 <chdir>:
SYSCALL(chdir)
    3952:	b8 09 00 00 00       	mov    $0x9,%eax
    3957:	cd 40                	int    $0x40
    3959:	c3                   	ret    

0000395a <dup>:
SYSCALL(dup)
    395a:	b8 0a 00 00 00       	mov    $0xa,%eax
    395f:	cd 40                	int    $0x40
    3961:	c3                   	ret    

00003962 <getpid>:
SYSCALL(getpid)
    3962:	b8 0b 00 00 00       	mov    $0xb,%eax
    3967:	cd 40                	int    $0x40
    3969:	c3                   	ret    

0000396a <sbrk>:
SYSCALL(sbrk)
    396a:	b8 0c 00 00 00       	mov    $0xc,%eax
    396f:	cd 40                	int    $0x40
    3971:	c3                   	ret    

00003972 <sleep>:
SYSCALL(sleep)
    3972:	b8 0d 00 00 00       	mov    $0xd,%eax
    3977:	cd 40                	int    $0x40
    3979:	c3                   	ret    

0000397a <uptime>:
SYSCALL(uptime)
    397a:	b8 0e 00 00 00       	mov    $0xe,%eax
    397f:	cd 40                	int    $0x40
    3981:	c3                   	ret    
    3982:	66 90                	xchg   %ax,%ax
    3984:	66 90                	xchg   %ax,%ax
    3986:	66 90                	xchg   %ax,%ax
    3988:	66 90                	xchg   %ax,%ax
    398a:	66 90                	xchg   %ax,%ax
    398c:	66 90                	xchg   %ax,%ax
    398e:	66 90                	xchg   %ax,%ax

00003990 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3990:	55                   	push   %ebp
    3991:	89 e5                	mov    %esp,%ebp
    3993:	57                   	push   %edi
    3994:	56                   	push   %esi
    3995:	53                   	push   %ebx
    3996:	89 c6                	mov    %eax,%esi
    3998:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    399b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    399e:	85 db                	test   %ebx,%ebx
    39a0:	74 7e                	je     3a20 <printint+0x90>
    39a2:	89 d0                	mov    %edx,%eax
    39a4:	c1 e8 1f             	shr    $0x1f,%eax
    39a7:	84 c0                	test   %al,%al
    39a9:	74 75                	je     3a20 <printint+0x90>
    neg = 1;
    x = -xx;
    39ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    39ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    39b4:	f7 d8                	neg    %eax
    39b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    39b9:	31 ff                	xor    %edi,%edi
    39bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    39be:	89 ce                	mov    %ecx,%esi
    39c0:	eb 08                	jmp    39ca <printint+0x3a>
    39c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    39c8:	89 cf                	mov    %ecx,%edi
    39ca:	31 d2                	xor    %edx,%edx
    39cc:	8d 4f 01             	lea    0x1(%edi),%ecx
    39cf:	f7 f6                	div    %esi
    39d1:	0f b6 92 cc 54 00 00 	movzbl 0x54cc(%edx),%edx
  }while((x /= base) != 0);
    39d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    39da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    39dd:	75 e9                	jne    39c8 <printint+0x38>
  if(neg)
    39df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    39e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    39e5:	85 c0                	test   %eax,%eax
    39e7:	74 08                	je     39f1 <printint+0x61>
    buf[i++] = '-';
    39e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    39ee:	8d 4f 02             	lea    0x2(%edi),%ecx
    39f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    39f5:	8d 76 00             	lea    0x0(%esi),%esi
    39f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    39fb:	83 ec 04             	sub    $0x4,%esp
    39fe:	83 ef 01             	sub    $0x1,%edi
    3a01:	6a 01                	push   $0x1
    3a03:	53                   	push   %ebx
    3a04:	56                   	push   %esi
    3a05:	88 45 d7             	mov    %al,-0x29(%ebp)
    3a08:	e8 f5 fe ff ff       	call   3902 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3a0d:	83 c4 10             	add    $0x10,%esp
    3a10:	39 df                	cmp    %ebx,%edi
    3a12:	75 e4                	jne    39f8 <printint+0x68>
    putc(fd, buf[i]);
}
    3a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a17:	5b                   	pop    %ebx
    3a18:	5e                   	pop    %esi
    3a19:	5f                   	pop    %edi
    3a1a:	5d                   	pop    %ebp
    3a1b:	c3                   	ret    
    3a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3a20:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3a22:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3a29:	eb 8b                	jmp    39b6 <printint+0x26>
    3a2b:	90                   	nop
    3a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003a30 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a30:	55                   	push   %ebp
    3a31:	89 e5                	mov    %esp,%ebp
    3a33:	57                   	push   %edi
    3a34:	56                   	push   %esi
    3a35:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a36:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a39:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a3c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a3f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a42:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a45:	0f b6 1e             	movzbl (%esi),%ebx
    3a48:	83 c6 01             	add    $0x1,%esi
    3a4b:	84 db                	test   %bl,%bl
    3a4d:	0f 84 b0 00 00 00    	je     3b03 <printf+0xd3>
    3a53:	31 d2                	xor    %edx,%edx
    3a55:	eb 39                	jmp    3a90 <printf+0x60>
    3a57:	89 f6                	mov    %esi,%esi
    3a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a60:	83 f8 25             	cmp    $0x25,%eax
    3a63:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3a66:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a6b:	74 18                	je     3a85 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a6d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a70:	83 ec 04             	sub    $0x4,%esp
    3a73:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a76:	6a 01                	push   $0x1
    3a78:	50                   	push   %eax
    3a79:	57                   	push   %edi
    3a7a:	e8 83 fe ff ff       	call   3902 <write>
    3a7f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3a82:	83 c4 10             	add    $0x10,%esp
    3a85:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a88:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a8c:	84 db                	test   %bl,%bl
    3a8e:	74 73                	je     3b03 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3a90:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3a92:	0f be cb             	movsbl %bl,%ecx
    3a95:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a98:	74 c6                	je     3a60 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a9a:	83 fa 25             	cmp    $0x25,%edx
    3a9d:	75 e6                	jne    3a85 <printf+0x55>
      if(c == 'd'){
    3a9f:	83 f8 64             	cmp    $0x64,%eax
    3aa2:	0f 84 f8 00 00 00    	je     3ba0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3aa8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3aae:	83 f9 70             	cmp    $0x70,%ecx
    3ab1:	74 5d                	je     3b10 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3ab3:	83 f8 73             	cmp    $0x73,%eax
    3ab6:	0f 84 84 00 00 00    	je     3b40 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3abc:	83 f8 63             	cmp    $0x63,%eax
    3abf:	0f 84 ea 00 00 00    	je     3baf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3ac5:	83 f8 25             	cmp    $0x25,%eax
    3ac8:	0f 84 c2 00 00 00    	je     3b90 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ace:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3ad1:	83 ec 04             	sub    $0x4,%esp
    3ad4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3ad8:	6a 01                	push   $0x1
    3ada:	50                   	push   %eax
    3adb:	57                   	push   %edi
    3adc:	e8 21 fe ff ff       	call   3902 <write>
    3ae1:	83 c4 0c             	add    $0xc,%esp
    3ae4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3ae7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3aea:	6a 01                	push   $0x1
    3aec:	50                   	push   %eax
    3aed:	57                   	push   %edi
    3aee:	83 c6 01             	add    $0x1,%esi
    3af1:	e8 0c fe ff ff       	call   3902 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3af6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3afa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3afd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3aff:	84 db                	test   %bl,%bl
    3b01:	75 8d                	jne    3a90 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3b03:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b06:	5b                   	pop    %ebx
    3b07:	5e                   	pop    %esi
    3b08:	5f                   	pop    %edi
    3b09:	5d                   	pop    %ebp
    3b0a:	c3                   	ret    
    3b0b:	90                   	nop
    3b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3b10:	83 ec 0c             	sub    $0xc,%esp
    3b13:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b18:	6a 00                	push   $0x0
    3b1a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3b1d:	89 f8                	mov    %edi,%eax
    3b1f:	8b 13                	mov    (%ebx),%edx
    3b21:	e8 6a fe ff ff       	call   3990 <printint>
        ap++;
    3b26:	89 d8                	mov    %ebx,%eax
    3b28:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b2b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3b2d:	83 c0 04             	add    $0x4,%eax
    3b30:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3b33:	e9 4d ff ff ff       	jmp    3a85 <printf+0x55>
    3b38:	90                   	nop
    3b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3b40:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b43:	8b 18                	mov    (%eax),%ebx
        ap++;
    3b45:	83 c0 04             	add    $0x4,%eax
    3b48:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3b4b:	b8 c4 54 00 00       	mov    $0x54c4,%eax
    3b50:	85 db                	test   %ebx,%ebx
    3b52:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    3b55:	0f b6 03             	movzbl (%ebx),%eax
    3b58:	84 c0                	test   %al,%al
    3b5a:	74 23                	je     3b7f <printf+0x14f>
    3b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b60:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b63:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3b66:	83 ec 04             	sub    $0x4,%esp
    3b69:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3b6b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b6e:	50                   	push   %eax
    3b6f:	57                   	push   %edi
    3b70:	e8 8d fd ff ff       	call   3902 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3b75:	0f b6 03             	movzbl (%ebx),%eax
    3b78:	83 c4 10             	add    $0x10,%esp
    3b7b:	84 c0                	test   %al,%al
    3b7d:	75 e1                	jne    3b60 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b7f:	31 d2                	xor    %edx,%edx
    3b81:	e9 ff fe ff ff       	jmp    3a85 <printf+0x55>
    3b86:	8d 76 00             	lea    0x0(%esi),%esi
    3b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b90:	83 ec 04             	sub    $0x4,%esp
    3b93:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3b96:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3b99:	6a 01                	push   $0x1
    3b9b:	e9 4c ff ff ff       	jmp    3aec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3ba0:	83 ec 0c             	sub    $0xc,%esp
    3ba3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3ba8:	6a 01                	push   $0x1
    3baa:	e9 6b ff ff ff       	jmp    3b1a <printf+0xea>
    3baf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bb2:	83 ec 04             	sub    $0x4,%esp
    3bb5:	8b 03                	mov    (%ebx),%eax
    3bb7:	6a 01                	push   $0x1
    3bb9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3bbc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3bbf:	50                   	push   %eax
    3bc0:	57                   	push   %edi
    3bc1:	e8 3c fd ff ff       	call   3902 <write>
    3bc6:	e9 5b ff ff ff       	jmp    3b26 <printf+0xf6>
    3bcb:	66 90                	xchg   %ax,%ax
    3bcd:	66 90                	xchg   %ax,%ax
    3bcf:	90                   	nop

00003bd0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bd0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bd1:	a1 40 5e 00 00       	mov    0x5e40,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bd6:	89 e5                	mov    %esp,%ebp
    3bd8:	57                   	push   %edi
    3bd9:	56                   	push   %esi
    3bda:	53                   	push   %ebx
    3bdb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bde:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3be0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3be3:	39 c8                	cmp    %ecx,%eax
    3be5:	73 19                	jae    3c00 <free+0x30>
    3be7:	89 f6                	mov    %esi,%esi
    3be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3bf0:	39 d1                	cmp    %edx,%ecx
    3bf2:	72 1c                	jb     3c10 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bf4:	39 d0                	cmp    %edx,%eax
    3bf6:	73 18                	jae    3c10 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bf8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bfa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bfc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bfe:	72 f0                	jb     3bf0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c00:	39 d0                	cmp    %edx,%eax
    3c02:	72 f4                	jb     3bf8 <free+0x28>
    3c04:	39 d1                	cmp    %edx,%ecx
    3c06:	73 f0                	jae    3bf8 <free+0x28>
    3c08:	90                   	nop
    3c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c10:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c13:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c16:	39 d7                	cmp    %edx,%edi
    3c18:	74 19                	je     3c33 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3c1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c1d:	8b 50 04             	mov    0x4(%eax),%edx
    3c20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c23:	39 f1                	cmp    %esi,%ecx
    3c25:	74 23                	je     3c4a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c27:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c29:	a3 40 5e 00 00       	mov    %eax,0x5e40
}
    3c2e:	5b                   	pop    %ebx
    3c2f:	5e                   	pop    %esi
    3c30:	5f                   	pop    %edi
    3c31:	5d                   	pop    %ebp
    3c32:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3c33:	03 72 04             	add    0x4(%edx),%esi
    3c36:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c39:	8b 10                	mov    (%eax),%edx
    3c3b:	8b 12                	mov    (%edx),%edx
    3c3d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c40:	8b 50 04             	mov    0x4(%eax),%edx
    3c43:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c46:	39 f1                	cmp    %esi,%ecx
    3c48:	75 dd                	jne    3c27 <free+0x57>
    p->s.size += bp->s.size;
    3c4a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c4d:	a3 40 5e 00 00       	mov    %eax,0x5e40
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3c52:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c55:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c58:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3c5a:	5b                   	pop    %ebx
    3c5b:	5e                   	pop    %esi
    3c5c:	5f                   	pop    %edi
    3c5d:	5d                   	pop    %ebp
    3c5e:	c3                   	ret    
    3c5f:	90                   	nop

00003c60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	57                   	push   %edi
    3c64:	56                   	push   %esi
    3c65:	53                   	push   %ebx
    3c66:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c69:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c6c:	8b 15 40 5e 00 00    	mov    0x5e40,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c72:	8d 78 07             	lea    0x7(%eax),%edi
    3c75:	c1 ef 03             	shr    $0x3,%edi
    3c78:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3c7b:	85 d2                	test   %edx,%edx
    3c7d:	0f 84 a3 00 00 00    	je     3d26 <malloc+0xc6>
    3c83:	8b 02                	mov    (%edx),%eax
    3c85:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3c88:	39 cf                	cmp    %ecx,%edi
    3c8a:	76 74                	jbe    3d00 <malloc+0xa0>
    3c8c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3c92:	be 00 10 00 00       	mov    $0x1000,%esi
    3c97:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    3c9e:	0f 43 f7             	cmovae %edi,%esi
    3ca1:	ba 00 80 00 00       	mov    $0x8000,%edx
    3ca6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    3cac:	0f 46 da             	cmovbe %edx,%ebx
    3caf:	eb 10                	jmp    3cc1 <malloc+0x61>
    3cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cb8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3cba:	8b 48 04             	mov    0x4(%eax),%ecx
    3cbd:	39 cf                	cmp    %ecx,%edi
    3cbf:	76 3f                	jbe    3d00 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3cc1:	39 05 40 5e 00 00    	cmp    %eax,0x5e40
    3cc7:	89 c2                	mov    %eax,%edx
    3cc9:	75 ed                	jne    3cb8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3ccb:	83 ec 0c             	sub    $0xc,%esp
    3cce:	53                   	push   %ebx
    3ccf:	e8 96 fc ff ff       	call   396a <sbrk>
  if(p == (char*)-1)
    3cd4:	83 c4 10             	add    $0x10,%esp
    3cd7:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cda:	74 1c                	je     3cf8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3cdc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    3cdf:	83 ec 0c             	sub    $0xc,%esp
    3ce2:	83 c0 08             	add    $0x8,%eax
    3ce5:	50                   	push   %eax
    3ce6:	e8 e5 fe ff ff       	call   3bd0 <free>
  return freep;
    3ceb:	8b 15 40 5e 00 00    	mov    0x5e40,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3cf1:	83 c4 10             	add    $0x10,%esp
    3cf4:	85 d2                	test   %edx,%edx
    3cf6:	75 c0                	jne    3cb8 <malloc+0x58>
        return 0;
    3cf8:	31 c0                	xor    %eax,%eax
    3cfa:	eb 1c                	jmp    3d18 <malloc+0xb8>
    3cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3d00:	39 cf                	cmp    %ecx,%edi
    3d02:	74 1c                	je     3d20 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3d04:	29 f9                	sub    %edi,%ecx
    3d06:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3d09:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3d0c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3d0f:	89 15 40 5e 00 00    	mov    %edx,0x5e40
      return (void*)(p + 1);
    3d15:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3d18:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d1b:	5b                   	pop    %ebx
    3d1c:	5e                   	pop    %esi
    3d1d:	5f                   	pop    %edi
    3d1e:	5d                   	pop    %ebp
    3d1f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d20:	8b 08                	mov    (%eax),%ecx
    3d22:	89 0a                	mov    %ecx,(%edx)
    3d24:	eb e9                	jmp    3d0f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3d26:	c7 05 40 5e 00 00 44 	movl   $0x5e44,0x5e40
    3d2d:	5e 00 00 
    3d30:	c7 05 44 5e 00 00 44 	movl   $0x5e44,0x5e44
    3d37:	5e 00 00 
    base.s.size = 0;
    3d3a:	b8 44 5e 00 00       	mov    $0x5e44,%eax
    3d3f:	c7 05 48 5e 00 00 00 	movl   $0x0,0x5e48
    3d46:	00 00 00 
    3d49:	e9 3e ff ff ff       	jmp    3c8c <malloc+0x2c>
