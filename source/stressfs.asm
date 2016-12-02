
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 6e 09 00 	movl   $0x96e,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 62 05 00 00       	call   5a2 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 19 02 00 00       	call   275 <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 1a                	jmp    83 <main+0x83>
    if(fork(500) > 0)
  69:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  70:	e8 a5 03 00 00       	call   41a <fork>
  75:	85 c0                	test   %eax,%eax
  77:	7e 02                	jle    7b <main+0x7b>
      break;
  79:	eb 12                	jmp    8d <main+0x8d>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  7b:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  82:	01 
  83:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  8a:	03 
  8b:	7e dc                	jle    69 <main+0x69>
    if(fork(500) > 0)
      break;

  printf(1, "write %d\n", i);
  8d:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  94:	89 44 24 08          	mov    %eax,0x8(%esp)
  98:	c7 44 24 04 81 09 00 	movl   $0x981,0x4(%esp)
  9f:	00 
  a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a7:	e8 f6 04 00 00       	call   5a2 <printf>

  path[8] += i;
  ac:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  b3:	00 
  b4:	89 c2                	mov    %eax,%edx
  b6:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  c6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  cd:	00 
  ce:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  d5:	89 04 24             	mov    %eax,(%esp)
  d8:	e8 85 03 00 00       	call   462 <open>
  dd:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  e4:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  eb:	00 00 00 00 
  ef:	eb 27                	jmp    118 <main+0x118>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  f1:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f8:	00 
  f9:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 101:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 108:	89 04 24             	mov    %eax,(%esp)
 10b:	e8 32 03 00 00       	call   442 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 110:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 117:	01 
 118:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 11f:	13 
 120:	7e cf                	jle    f1 <main+0xf1>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 122:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 129:	89 04 24             	mov    %eax,(%esp)
 12c:	e8 19 03 00 00       	call   44a <close>

  printf(1, "read\n");
 131:	c7 44 24 04 8b 09 00 	movl   $0x98b,0x4(%esp)
 138:	00 
 139:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 140:	e8 5d 04 00 00       	call   5a2 <printf>

  fd = open(path, O_RDONLY);
 145:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14c:	00 
 14d:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 154:	89 04 24             	mov    %eax,(%esp)
 157:	e8 06 03 00 00       	call   462 <open>
 15c:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 163:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 16a:	00 00 00 00 
 16e:	eb 27                	jmp    197 <main+0x197>
    read(fd, data, sizeof(data));
 170:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 177:	00 
 178:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 17c:	89 44 24 04          	mov    %eax,0x4(%esp)
 180:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 ab 02 00 00       	call   43a <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 18f:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 196:	01 
 197:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 19e:	13 
 19f:	7e cf                	jle    170 <main+0x170>
    read(fd, data, sizeof(data));
  close(fd);
 1a1:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a8:	89 04 24             	mov    %eax,(%esp)
 1ab:	e8 9a 02 00 00       	call   44a <close>

  wait();
 1b0:	e8 75 02 00 00       	call   42a <wait>
  
  exit();
 1b5:	e8 68 02 00 00       	call   422 <exit>

000001ba <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1ba:	55                   	push   %ebp
 1bb:	89 e5                	mov    %esp,%ebp
 1bd:	57                   	push   %edi
 1be:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c2:	8b 55 10             	mov    0x10(%ebp),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	89 cb                	mov    %ecx,%ebx
 1ca:	89 df                	mov    %ebx,%edi
 1cc:	89 d1                	mov    %edx,%ecx
 1ce:	fc                   	cld    
 1cf:	f3 aa                	rep stos %al,%es:(%edi)
 1d1:	89 ca                	mov    %ecx,%edx
 1d3:	89 fb                	mov    %edi,%ebx
 1d5:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d8:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1db:	5b                   	pop    %ebx
 1dc:	5f                   	pop    %edi
 1dd:	5d                   	pop    %ebp
 1de:	c3                   	ret    

000001df <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1eb:	90                   	nop
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	8d 50 01             	lea    0x1(%eax),%edx
 1f2:	89 55 08             	mov    %edx,0x8(%ebp)
 1f5:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f8:	8d 4a 01             	lea    0x1(%edx),%ecx
 1fb:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1fe:	0f b6 12             	movzbl (%edx),%edx
 201:	88 10                	mov    %dl,(%eax)
 203:	0f b6 00             	movzbl (%eax),%eax
 206:	84 c0                	test   %al,%al
 208:	75 e2                	jne    1ec <strcpy+0xd>
    ;
  return os;
 20a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20d:	c9                   	leave  
 20e:	c3                   	ret    

0000020f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 212:	eb 08                	jmp    21c <strcmp+0xd>
    p++, q++;
 214:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 218:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	84 c0                	test   %al,%al
 224:	74 10                	je     236 <strcmp+0x27>
 226:	8b 45 08             	mov    0x8(%ebp),%eax
 229:	0f b6 10             	movzbl (%eax),%edx
 22c:	8b 45 0c             	mov    0xc(%ebp),%eax
 22f:	0f b6 00             	movzbl (%eax),%eax
 232:	38 c2                	cmp    %al,%dl
 234:	74 de                	je     214 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	0f b6 d0             	movzbl %al,%edx
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	0f b6 00             	movzbl (%eax),%eax
 245:	0f b6 c0             	movzbl %al,%eax
 248:	29 c2                	sub    %eax,%edx
 24a:	89 d0                	mov    %edx,%eax
}
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret    

0000024e <strlen>:

uint
strlen(char *s)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25b:	eb 04                	jmp    261 <strlen+0x13>
 25d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 261:	8b 55 fc             	mov    -0x4(%ebp),%edx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	01 d0                	add    %edx,%eax
 269:	0f b6 00             	movzbl (%eax),%eax
 26c:	84 c0                	test   %al,%al
 26e:	75 ed                	jne    25d <strlen+0xf>
    ;
  return n;
 270:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 273:	c9                   	leave  
 274:	c3                   	ret    

00000275 <memset>:

void*
memset(void *dst, int c, uint n)
{
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
 278:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 27b:	8b 45 10             	mov    0x10(%ebp),%eax
 27e:	89 44 24 08          	mov    %eax,0x8(%esp)
 282:	8b 45 0c             	mov    0xc(%ebp),%eax
 285:	89 44 24 04          	mov    %eax,0x4(%esp)
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	89 04 24             	mov    %eax,(%esp)
 28f:	e8 26 ff ff ff       	call   1ba <stosb>
  return dst;
 294:	8b 45 08             	mov    0x8(%ebp),%eax
}
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <strchr>:

char*
strchr(const char *s, char c)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	83 ec 04             	sub    $0x4,%esp
 29f:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a2:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2a5:	eb 14                	jmp    2bb <strchr+0x22>
    if(*s == c)
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	0f b6 00             	movzbl (%eax),%eax
 2ad:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2b0:	75 05                	jne    2b7 <strchr+0x1e>
      return (char*)s;
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	eb 13                	jmp    2ca <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	0f b6 00             	movzbl (%eax),%eax
 2c1:	84 c0                	test   %al,%al
 2c3:	75 e2                	jne    2a7 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <gets>:

char*
gets(char *buf, int max)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d9:	eb 4c                	jmp    327 <gets+0x5b>
    cc = read(0, &c, 1);
 2db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2e2:	00 
 2e3:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2f1:	e8 44 01 00 00       	call   43a <read>
 2f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2fd:	7f 02                	jg     301 <gets+0x35>
      break;
 2ff:	eb 31                	jmp    332 <gets+0x66>
    buf[i++] = c;
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	8d 50 01             	lea    0x1(%eax),%edx
 307:	89 55 f4             	mov    %edx,-0xc(%ebp)
 30a:	89 c2                	mov    %eax,%edx
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	01 c2                	add    %eax,%edx
 311:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 315:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 317:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31b:	3c 0a                	cmp    $0xa,%al
 31d:	74 13                	je     332 <gets+0x66>
 31f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 323:	3c 0d                	cmp    $0xd,%al
 325:	74 0b                	je     332 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 327:	8b 45 f4             	mov    -0xc(%ebp),%eax
 32a:	83 c0 01             	add    $0x1,%eax
 32d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 330:	7c a9                	jl     2db <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 332:	8b 55 f4             	mov    -0xc(%ebp),%edx
 335:	8b 45 08             	mov    0x8(%ebp),%eax
 338:	01 d0                	add    %edx,%eax
 33a:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 340:	c9                   	leave  
 341:	c3                   	ret    

00000342 <stat>:

int
stat(char *n, struct stat *st)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 348:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 34f:	00 
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 04 24             	mov    %eax,(%esp)
 356:	e8 07 01 00 00       	call   462 <open>
 35b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 35e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 362:	79 07                	jns    36b <stat+0x29>
    return -1;
 364:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 369:	eb 23                	jmp    38e <stat+0x4c>
  r = fstat(fd, st);
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 44 24 04          	mov    %eax,0x4(%esp)
 372:	8b 45 f4             	mov    -0xc(%ebp),%eax
 375:	89 04 24             	mov    %eax,(%esp)
 378:	e8 fd 00 00 00       	call   47a <fstat>
 37d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 380:	8b 45 f4             	mov    -0xc(%ebp),%eax
 383:	89 04 24             	mov    %eax,(%esp)
 386:	e8 bf 00 00 00       	call   44a <close>
  return r;
 38b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 38e:	c9                   	leave  
 38f:	c3                   	ret    

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 396:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 39d:	eb 25                	jmp    3c4 <atoi+0x34>
    n = n*10 + *s++ - '0';
 39f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e0 02             	shl    $0x2,%eax
 3a7:	01 d0                	add    %edx,%eax
 3a9:	01 c0                	add    %eax,%eax
 3ab:	89 c1                	mov    %eax,%ecx
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	8d 50 01             	lea    0x1(%eax),%edx
 3b3:	89 55 08             	mov    %edx,0x8(%ebp)
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f be c0             	movsbl %al,%eax
 3bc:	01 c8                	add    %ecx,%eax
 3be:	83 e8 30             	sub    $0x30,%eax
 3c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	0f b6 00             	movzbl (%eax),%eax
 3ca:	3c 2f                	cmp    $0x2f,%al
 3cc:	7e 0a                	jle    3d8 <atoi+0x48>
 3ce:	8b 45 08             	mov    0x8(%ebp),%eax
 3d1:	0f b6 00             	movzbl (%eax),%eax
 3d4:	3c 39                	cmp    $0x39,%al
 3d6:	7e c7                	jle    39f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3db:	c9                   	leave  
 3dc:	c3                   	ret    

000003dd <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3ef:	eb 17                	jmp    408 <memmove+0x2b>
    *dst++ = *src++;
 3f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3f4:	8d 50 01             	lea    0x1(%eax),%edx
 3f7:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3fd:	8d 4a 01             	lea    0x1(%edx),%ecx
 400:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 403:	0f b6 12             	movzbl (%edx),%edx
 406:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 408:	8b 45 10             	mov    0x10(%ebp),%eax
 40b:	8d 50 ff             	lea    -0x1(%eax),%edx
 40e:	89 55 10             	mov    %edx,0x10(%ebp)
 411:	85 c0                	test   %eax,%eax
 413:	7f dc                	jg     3f1 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 415:	8b 45 08             	mov    0x8(%ebp),%eax
}
 418:	c9                   	leave  
 419:	c3                   	ret    

0000041a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41a:	b8 01 00 00 00       	mov    $0x1,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exit>:
SYSCALL(exit)
 422:	b8 02 00 00 00       	mov    $0x2,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <wait>:
SYSCALL(wait)
 42a:	b8 03 00 00 00       	mov    $0x3,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <pipe>:
SYSCALL(pipe)
 432:	b8 04 00 00 00       	mov    $0x4,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <read>:
SYSCALL(read)
 43a:	b8 05 00 00 00       	mov    $0x5,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <write>:
SYSCALL(write)
 442:	b8 10 00 00 00       	mov    $0x10,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <close>:
SYSCALL(close)
 44a:	b8 15 00 00 00       	mov    $0x15,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <kill>:
SYSCALL(kill)
 452:	b8 06 00 00 00       	mov    $0x6,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <exec>:
SYSCALL(exec)
 45a:	b8 07 00 00 00       	mov    $0x7,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <open>:
SYSCALL(open)
 462:	b8 0f 00 00 00       	mov    $0xf,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <mknod>:
SYSCALL(mknod)
 46a:	b8 11 00 00 00       	mov    $0x11,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <unlink>:
SYSCALL(unlink)
 472:	b8 12 00 00 00       	mov    $0x12,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <fstat>:
SYSCALL(fstat)
 47a:	b8 08 00 00 00       	mov    $0x8,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <link>:
SYSCALL(link)
 482:	b8 13 00 00 00       	mov    $0x13,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mkdir>:
SYSCALL(mkdir)
 48a:	b8 14 00 00 00       	mov    $0x14,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <chdir>:
SYSCALL(chdir)
 492:	b8 09 00 00 00       	mov    $0x9,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <dup>:
SYSCALL(dup)
 49a:	b8 0a 00 00 00       	mov    $0xa,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <getpid>:
SYSCALL(getpid)
 4a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <sbrk>:
SYSCALL(sbrk)
 4aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <sleep>:
SYSCALL(sleep)
 4b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <uptime>:
SYSCALL(uptime)
 4ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c2:	55                   	push   %ebp
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	83 ec 18             	sub    $0x18,%esp
 4c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d5:	00 
 4d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	89 04 24             	mov    %eax,(%esp)
 4e3:	e8 5a ff ff ff       	call   442 <write>
}
 4e8:	c9                   	leave  
 4e9:	c3                   	ret    

000004ea <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	56                   	push   %esi
 4ee:	53                   	push   %ebx
 4ef:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4f9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4fd:	74 17                	je     516 <printint+0x2c>
 4ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 503:	79 11                	jns    516 <printint+0x2c>
    neg = 1;
 505:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	f7 d8                	neg    %eax
 511:	89 45 ec             	mov    %eax,-0x14(%ebp)
 514:	eb 06                	jmp    51c <printint+0x32>
  } else {
    x = xx;
 516:	8b 45 0c             	mov    0xc(%ebp),%eax
 519:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 51c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 523:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 526:	8d 41 01             	lea    0x1(%ecx),%eax
 529:	89 45 f4             	mov    %eax,-0xc(%ebp)
 52c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 52f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 532:	ba 00 00 00 00       	mov    $0x0,%edx
 537:	f7 f3                	div    %ebx
 539:	89 d0                	mov    %edx,%eax
 53b:	0f b6 80 dc 0b 00 00 	movzbl 0xbdc(%eax),%eax
 542:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 546:	8b 75 10             	mov    0x10(%ebp),%esi
 549:	8b 45 ec             	mov    -0x14(%ebp),%eax
 54c:	ba 00 00 00 00       	mov    $0x0,%edx
 551:	f7 f6                	div    %esi
 553:	89 45 ec             	mov    %eax,-0x14(%ebp)
 556:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55a:	75 c7                	jne    523 <printint+0x39>
  if(neg)
 55c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 560:	74 10                	je     572 <printint+0x88>
    buf[i++] = '-';
 562:	8b 45 f4             	mov    -0xc(%ebp),%eax
 565:	8d 50 01             	lea    0x1(%eax),%edx
 568:	89 55 f4             	mov    %edx,-0xc(%ebp)
 56b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 570:	eb 1f                	jmp    591 <printint+0xa7>
 572:	eb 1d                	jmp    591 <printint+0xa7>
    putc(fd, buf[i]);
 574:	8d 55 dc             	lea    -0x24(%ebp),%edx
 577:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57a:	01 d0                	add    %edx,%eax
 57c:	0f b6 00             	movzbl (%eax),%eax
 57f:	0f be c0             	movsbl %al,%eax
 582:	89 44 24 04          	mov    %eax,0x4(%esp)
 586:	8b 45 08             	mov    0x8(%ebp),%eax
 589:	89 04 24             	mov    %eax,(%esp)
 58c:	e8 31 ff ff ff       	call   4c2 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 591:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 595:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 599:	79 d9                	jns    574 <printint+0x8a>
    putc(fd, buf[i]);
}
 59b:	83 c4 30             	add    $0x30,%esp
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    

000005a2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5af:	8d 45 0c             	lea    0xc(%ebp),%eax
 5b2:	83 c0 04             	add    $0x4,%eax
 5b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5bf:	e9 7c 01 00 00       	jmp    740 <printf+0x19e>
    c = fmt[i] & 0xff;
 5c4:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ca:	01 d0                	add    %edx,%eax
 5cc:	0f b6 00             	movzbl (%eax),%eax
 5cf:	0f be c0             	movsbl %al,%eax
 5d2:	25 ff 00 00 00       	and    $0xff,%eax
 5d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5de:	75 2c                	jne    60c <printf+0x6a>
      if(c == '%'){
 5e0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5e4:	75 0c                	jne    5f2 <printf+0x50>
        state = '%';
 5e6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5ed:	e9 4a 01 00 00       	jmp    73c <printf+0x19a>
      } else {
        putc(fd, c);
 5f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f5:	0f be c0             	movsbl %al,%eax
 5f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	89 04 24             	mov    %eax,(%esp)
 602:	e8 bb fe ff ff       	call   4c2 <putc>
 607:	e9 30 01 00 00       	jmp    73c <printf+0x19a>
      }
    } else if(state == '%'){
 60c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 610:	0f 85 26 01 00 00    	jne    73c <printf+0x19a>
      if(c == 'd'){
 616:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 61a:	75 2d                	jne    649 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 61c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61f:	8b 00                	mov    (%eax),%eax
 621:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 628:	00 
 629:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 630:	00 
 631:	89 44 24 04          	mov    %eax,0x4(%esp)
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	89 04 24             	mov    %eax,(%esp)
 63b:	e8 aa fe ff ff       	call   4ea <printint>
        ap++;
 640:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 644:	e9 ec 00 00 00       	jmp    735 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 649:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 64d:	74 06                	je     655 <printf+0xb3>
 64f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 653:	75 2d                	jne    682 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 655:	8b 45 e8             	mov    -0x18(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 661:	00 
 662:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 669:	00 
 66a:	89 44 24 04          	mov    %eax,0x4(%esp)
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	89 04 24             	mov    %eax,(%esp)
 674:	e8 71 fe ff ff       	call   4ea <printint>
        ap++;
 679:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 67d:	e9 b3 00 00 00       	jmp    735 <printf+0x193>
      } else if(c == 's'){
 682:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 686:	75 45                	jne    6cd <printf+0x12b>
        s = (char*)*ap;
 688:	8b 45 e8             	mov    -0x18(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 690:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 694:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 698:	75 09                	jne    6a3 <printf+0x101>
          s = "(null)";
 69a:	c7 45 f4 91 09 00 00 	movl   $0x991,-0xc(%ebp)
        while(*s != 0){
 6a1:	eb 1e                	jmp    6c1 <printf+0x11f>
 6a3:	eb 1c                	jmp    6c1 <printf+0x11f>
          putc(fd, *s);
 6a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a8:	0f b6 00             	movzbl (%eax),%eax
 6ab:	0f be c0             	movsbl %al,%eax
 6ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	89 04 24             	mov    %eax,(%esp)
 6b8:	e8 05 fe ff ff       	call   4c2 <putc>
          s++;
 6bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c4:	0f b6 00             	movzbl (%eax),%eax
 6c7:	84 c0                	test   %al,%al
 6c9:	75 da                	jne    6a5 <printf+0x103>
 6cb:	eb 68                	jmp    735 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6cd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6d1:	75 1d                	jne    6f0 <printf+0x14e>
        putc(fd, *ap);
 6d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d6:	8b 00                	mov    (%eax),%eax
 6d8:	0f be c0             	movsbl %al,%eax
 6db:	89 44 24 04          	mov    %eax,0x4(%esp)
 6df:	8b 45 08             	mov    0x8(%ebp),%eax
 6e2:	89 04 24             	mov    %eax,(%esp)
 6e5:	e8 d8 fd ff ff       	call   4c2 <putc>
        ap++;
 6ea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ee:	eb 45                	jmp    735 <printf+0x193>
      } else if(c == '%'){
 6f0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6f4:	75 17                	jne    70d <printf+0x16b>
        putc(fd, c);
 6f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f9:	0f be c0             	movsbl %al,%eax
 6fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	89 04 24             	mov    %eax,(%esp)
 706:	e8 b7 fd ff ff       	call   4c2 <putc>
 70b:	eb 28                	jmp    735 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 70d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 714:	00 
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	89 04 24             	mov    %eax,(%esp)
 71b:	e8 a2 fd ff ff       	call   4c2 <putc>
        putc(fd, c);
 720:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 723:	0f be c0             	movsbl %al,%eax
 726:	89 44 24 04          	mov    %eax,0x4(%esp)
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	89 04 24             	mov    %eax,(%esp)
 730:	e8 8d fd ff ff       	call   4c2 <putc>
      }
      state = 0;
 735:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 73c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 740:	8b 55 0c             	mov    0xc(%ebp),%edx
 743:	8b 45 f0             	mov    -0x10(%ebp),%eax
 746:	01 d0                	add    %edx,%eax
 748:	0f b6 00             	movzbl (%eax),%eax
 74b:	84 c0                	test   %al,%al
 74d:	0f 85 71 fe ff ff    	jne    5c4 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 753:	c9                   	leave  
 754:	c3                   	ret    

00000755 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 755:	55                   	push   %ebp
 756:	89 e5                	mov    %esp,%ebp
 758:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 75b:	8b 45 08             	mov    0x8(%ebp),%eax
 75e:	83 e8 08             	sub    $0x8,%eax
 761:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 764:	a1 f8 0b 00 00       	mov    0xbf8,%eax
 769:	89 45 fc             	mov    %eax,-0x4(%ebp)
 76c:	eb 24                	jmp    792 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 00                	mov    (%eax),%eax
 773:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 776:	77 12                	ja     78a <free+0x35>
 778:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77e:	77 24                	ja     7a4 <free+0x4f>
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 788:	77 1a                	ja     7a4 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78d:	8b 00                	mov    (%eax),%eax
 78f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 798:	76 d4                	jbe    76e <free+0x19>
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a2:	76 ca                	jbe    76e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	01 c2                	add    %eax,%edx
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	39 c2                	cmp    %eax,%edx
 7bd:	75 24                	jne    7e3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	8b 50 04             	mov    0x4(%eax),%edx
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	8b 40 04             	mov    0x4(%eax),%eax
 7cd:	01 c2                	add    %eax,%edx
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7df:	89 10                	mov    %edx,(%eax)
 7e1:	eb 0a                	jmp    7ed <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e6:	8b 10                	mov    (%eax),%edx
 7e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7eb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f0:	8b 40 04             	mov    0x4(%eax),%eax
 7f3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	01 d0                	add    %edx,%eax
 7ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 802:	75 20                	jne    824 <free+0xcf>
    p->s.size += bp->s.size;
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 50 04             	mov    0x4(%eax),%edx
 80a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80d:	8b 40 04             	mov    0x4(%eax),%eax
 810:	01 c2                	add    %eax,%edx
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 818:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81b:	8b 10                	mov    (%eax),%edx
 81d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 820:	89 10                	mov    %edx,(%eax)
 822:	eb 08                	jmp    82c <free+0xd7>
  } else
    p->s.ptr = bp;
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	8b 55 f8             	mov    -0x8(%ebp),%edx
 82a:	89 10                	mov    %edx,(%eax)
  freep = p;
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	a3 f8 0b 00 00       	mov    %eax,0xbf8
}
 834:	c9                   	leave  
 835:	c3                   	ret    

00000836 <morecore>:

static Header*
morecore(uint nu)
{
 836:	55                   	push   %ebp
 837:	89 e5                	mov    %esp,%ebp
 839:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 83c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 843:	77 07                	ja     84c <morecore+0x16>
    nu = 4096;
 845:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 84c:	8b 45 08             	mov    0x8(%ebp),%eax
 84f:	c1 e0 03             	shl    $0x3,%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 50 fc ff ff       	call   4aa <sbrk>
 85a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 85d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 861:	75 07                	jne    86a <morecore+0x34>
    return 0;
 863:	b8 00 00 00 00       	mov    $0x0,%eax
 868:	eb 22                	jmp    88c <morecore+0x56>
  hp = (Header*)p;
 86a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 870:	8b 45 f0             	mov    -0x10(%ebp),%eax
 873:	8b 55 08             	mov    0x8(%ebp),%edx
 876:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	83 c0 08             	add    $0x8,%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 ce fe ff ff       	call   755 <free>
  return freep;
 887:	a1 f8 0b 00 00       	mov    0xbf8,%eax
}
 88c:	c9                   	leave  
 88d:	c3                   	ret    

0000088e <malloc>:

void*
malloc(uint nbytes)
{
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	83 c0 07             	add    $0x7,%eax
 89a:	c1 e8 03             	shr    $0x3,%eax
 89d:	83 c0 01             	add    $0x1,%eax
 8a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8a3:	a1 f8 0b 00 00       	mov    0xbf8,%eax
 8a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8af:	75 23                	jne    8d4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8b1:	c7 45 f0 f0 0b 00 00 	movl   $0xbf0,-0x10(%ebp)
 8b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bb:	a3 f8 0b 00 00       	mov    %eax,0xbf8
 8c0:	a1 f8 0b 00 00       	mov    0xbf8,%eax
 8c5:	a3 f0 0b 00 00       	mov    %eax,0xbf0
    base.s.size = 0;
 8ca:	c7 05 f4 0b 00 00 00 	movl   $0x0,0xbf4
 8d1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d7:	8b 00                	mov    (%eax),%eax
 8d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8e5:	72 4d                	jb     934 <malloc+0xa6>
      if(p->s.size == nunits)
 8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ea:	8b 40 04             	mov    0x4(%eax),%eax
 8ed:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8f0:	75 0c                	jne    8fe <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f5:	8b 10                	mov    (%eax),%edx
 8f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fa:	89 10                	mov    %edx,(%eax)
 8fc:	eb 26                	jmp    924 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 901:	8b 40 04             	mov    0x4(%eax),%eax
 904:	2b 45 ec             	sub    -0x14(%ebp),%eax
 907:	89 c2                	mov    %eax,%edx
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 90f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 912:	8b 40 04             	mov    0x4(%eax),%eax
 915:	c1 e0 03             	shl    $0x3,%eax
 918:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 91b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 921:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 924:	8b 45 f0             	mov    -0x10(%ebp),%eax
 927:	a3 f8 0b 00 00       	mov    %eax,0xbf8
      return (void*)(p + 1);
 92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92f:	83 c0 08             	add    $0x8,%eax
 932:	eb 38                	jmp    96c <malloc+0xde>
    }
    if(p == freep)
 934:	a1 f8 0b 00 00       	mov    0xbf8,%eax
 939:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 93c:	75 1b                	jne    959 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 93e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 941:	89 04 24             	mov    %eax,(%esp)
 944:	e8 ed fe ff ff       	call   836 <morecore>
 949:	89 45 f4             	mov    %eax,-0xc(%ebp)
 94c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 950:	75 07                	jne    959 <malloc+0xcb>
        return 0;
 952:	b8 00 00 00 00       	mov    $0x0,%eax
 957:	eb 13                	jmp    96c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 95f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 962:	8b 00                	mov    (%eax),%eax
 964:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 967:	e9 70 ff ff ff       	jmp    8dc <malloc+0x4e>
}
 96c:	c9                   	leave  
 96d:	c3                   	ret    
