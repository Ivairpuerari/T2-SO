
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork(500) > 0)
   9:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  10:	e8 75 02 00 00       	call   28a <fork>
  15:	85 c0                	test   %eax,%eax
  17:	7e 0c                	jle    25 <main+0x25>
    sleep(5);  // Let child exit before parent.
  19:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  20:	e8 fd 02 00 00       	call   322 <sleep>
  exit();
  25:	e8 68 02 00 00       	call   292 <exit>

0000002a <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2a:	55                   	push   %ebp
  2b:	89 e5                	mov    %esp,%ebp
  2d:	57                   	push   %edi
  2e:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  2f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  32:	8b 55 10             	mov    0x10(%ebp),%edx
  35:	8b 45 0c             	mov    0xc(%ebp),%eax
  38:	89 cb                	mov    %ecx,%ebx
  3a:	89 df                	mov    %ebx,%edi
  3c:	89 d1                	mov    %edx,%ecx
  3e:	fc                   	cld    
  3f:	f3 aa                	rep stos %al,%es:(%edi)
  41:	89 ca                	mov    %ecx,%edx
  43:	89 fb                	mov    %edi,%ebx
  45:	89 5d 08             	mov    %ebx,0x8(%ebp)
  48:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4b:	5b                   	pop    %ebx
  4c:	5f                   	pop    %edi
  4d:	5d                   	pop    %ebp
  4e:	c3                   	ret    

0000004f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  4f:	55                   	push   %ebp
  50:	89 e5                	mov    %esp,%ebp
  52:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5b:	90                   	nop
  5c:	8b 45 08             	mov    0x8(%ebp),%eax
  5f:	8d 50 01             	lea    0x1(%eax),%edx
  62:	89 55 08             	mov    %edx,0x8(%ebp)
  65:	8b 55 0c             	mov    0xc(%ebp),%edx
  68:	8d 4a 01             	lea    0x1(%edx),%ecx
  6b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  6e:	0f b6 12             	movzbl (%edx),%edx
  71:	88 10                	mov    %dl,(%eax)
  73:	0f b6 00             	movzbl (%eax),%eax
  76:	84 c0                	test   %al,%al
  78:	75 e2                	jne    5c <strcpy+0xd>
    ;
  return os;
  7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7d:	c9                   	leave  
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  82:	eb 08                	jmp    8c <strcmp+0xd>
    p++, q++;
  84:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  88:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	84 c0                	test   %al,%al
  94:	74 10                	je     a6 <strcmp+0x27>
  96:	8b 45 08             	mov    0x8(%ebp),%eax
  99:	0f b6 10             	movzbl (%eax),%edx
  9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  9f:	0f b6 00             	movzbl (%eax),%eax
  a2:	38 c2                	cmp    %al,%dl
  a4:	74 de                	je     84 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a6:	8b 45 08             	mov    0x8(%ebp),%eax
  a9:	0f b6 00             	movzbl (%eax),%eax
  ac:	0f b6 d0             	movzbl %al,%edx
  af:	8b 45 0c             	mov    0xc(%ebp),%eax
  b2:	0f b6 00             	movzbl (%eax),%eax
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	29 c2                	sub    %eax,%edx
  ba:	89 d0                	mov    %edx,%eax
}
  bc:	5d                   	pop    %ebp
  bd:	c3                   	ret    

000000be <strlen>:

uint
strlen(char *s)
{
  be:	55                   	push   %ebp
  bf:	89 e5                	mov    %esp,%ebp
  c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cb:	eb 04                	jmp    d1 <strlen+0x13>
  cd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	01 d0                	add    %edx,%eax
  d9:	0f b6 00             	movzbl (%eax),%eax
  dc:	84 c0                	test   %al,%al
  de:	75 ed                	jne    cd <strlen+0xf>
    ;
  return n;
  e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e3:	c9                   	leave  
  e4:	c3                   	ret    

000000e5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	89 44 24 08          	mov    %eax,0x8(%esp)
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  f9:	8b 45 08             	mov    0x8(%ebp),%eax
  fc:	89 04 24             	mov    %eax,(%esp)
  ff:	e8 26 ff ff ff       	call   2a <stosb>
  return dst;
 104:	8b 45 08             	mov    0x8(%ebp),%eax
}
 107:	c9                   	leave  
 108:	c3                   	ret    

00000109 <strchr>:

char*
strchr(const char *s, char c)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 115:	eb 14                	jmp    12b <strchr+0x22>
    if(*s == c)
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	0f b6 00             	movzbl (%eax),%eax
 11d:	3a 45 fc             	cmp    -0x4(%ebp),%al
 120:	75 05                	jne    127 <strchr+0x1e>
      return (char*)s;
 122:	8b 45 08             	mov    0x8(%ebp),%eax
 125:	eb 13                	jmp    13a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 127:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	75 e2                	jne    117 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 135:	b8 00 00 00 00       	mov    $0x0,%eax
}
 13a:	c9                   	leave  
 13b:	c3                   	ret    

0000013c <gets>:

char*
gets(char *buf, int max)
{
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 142:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 149:	eb 4c                	jmp    197 <gets+0x5b>
    cc = read(0, &c, 1);
 14b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 152:	00 
 153:	8d 45 ef             	lea    -0x11(%ebp),%eax
 156:	89 44 24 04          	mov    %eax,0x4(%esp)
 15a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 161:	e8 44 01 00 00       	call   2aa <read>
 166:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 169:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16d:	7f 02                	jg     171 <gets+0x35>
      break;
 16f:	eb 31                	jmp    1a2 <gets+0x66>
    buf[i++] = c;
 171:	8b 45 f4             	mov    -0xc(%ebp),%eax
 174:	8d 50 01             	lea    0x1(%eax),%edx
 177:	89 55 f4             	mov    %edx,-0xc(%ebp)
 17a:	89 c2                	mov    %eax,%edx
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	01 c2                	add    %eax,%edx
 181:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 185:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 187:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18b:	3c 0a                	cmp    $0xa,%al
 18d:	74 13                	je     1a2 <gets+0x66>
 18f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 193:	3c 0d                	cmp    $0xd,%al
 195:	74 0b                	je     1a2 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 197:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19a:	83 c0 01             	add    $0x1,%eax
 19d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a0:	7c a9                	jl     14b <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b0:	c9                   	leave  
 1b1:	c3                   	ret    

000001b2 <stat>:

int
stat(char *n, struct stat *st)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bf:	00 
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 07 01 00 00       	call   2d2 <open>
 1cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d2:	79 07                	jns    1db <stat+0x29>
    return -1;
 1d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d9:	eb 23                	jmp    1fe <stat+0x4c>
  r = fstat(fd, st);
 1db:	8b 45 0c             	mov    0xc(%ebp),%eax
 1de:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 fd 00 00 00       	call   2ea <fstat>
 1ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 bf 00 00 00       	call   2ba <close>
  return r;
 1fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 206:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20d:	eb 25                	jmp    234 <atoi+0x34>
    n = n*10 + *s++ - '0';
 20f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 212:	89 d0                	mov    %edx,%eax
 214:	c1 e0 02             	shl    $0x2,%eax
 217:	01 d0                	add    %edx,%eax
 219:	01 c0                	add    %eax,%eax
 21b:	89 c1                	mov    %eax,%ecx
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	8d 50 01             	lea    0x1(%eax),%edx
 223:	89 55 08             	mov    %edx,0x8(%ebp)
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	0f be c0             	movsbl %al,%eax
 22c:	01 c8                	add    %ecx,%eax
 22e:	83 e8 30             	sub    $0x30,%eax
 231:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	3c 2f                	cmp    $0x2f,%al
 23c:	7e 0a                	jle    248 <atoi+0x48>
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3c 39                	cmp    $0x39,%al
 246:	7e c7                	jle    20f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 248:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 25f:	eb 17                	jmp    278 <memmove+0x2b>
    *dst++ = *src++;
 261:	8b 45 fc             	mov    -0x4(%ebp),%eax
 264:	8d 50 01             	lea    0x1(%eax),%edx
 267:	89 55 fc             	mov    %edx,-0x4(%ebp)
 26a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26d:	8d 4a 01             	lea    0x1(%edx),%ecx
 270:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 273:	0f b6 12             	movzbl (%edx),%edx
 276:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 278:	8b 45 10             	mov    0x10(%ebp),%eax
 27b:	8d 50 ff             	lea    -0x1(%eax),%edx
 27e:	89 55 10             	mov    %edx,0x10(%ebp)
 281:	85 c0                	test   %eax,%eax
 283:	7f dc                	jg     261 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 285:	8b 45 08             	mov    0x8(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28a:	b8 01 00 00 00       	mov    $0x1,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <exit>:
SYSCALL(exit)
 292:	b8 02 00 00 00       	mov    $0x2,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <wait>:
SYSCALL(wait)
 29a:	b8 03 00 00 00       	mov    $0x3,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <pipe>:
SYSCALL(pipe)
 2a2:	b8 04 00 00 00       	mov    $0x4,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <read>:
SYSCALL(read)
 2aa:	b8 05 00 00 00       	mov    $0x5,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <write>:
SYSCALL(write)
 2b2:	b8 10 00 00 00       	mov    $0x10,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <close>:
SYSCALL(close)
 2ba:	b8 15 00 00 00       	mov    $0x15,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <kill>:
SYSCALL(kill)
 2c2:	b8 06 00 00 00       	mov    $0x6,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <exec>:
SYSCALL(exec)
 2ca:	b8 07 00 00 00       	mov    $0x7,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <open>:
SYSCALL(open)
 2d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mknod>:
SYSCALL(mknod)
 2da:	b8 11 00 00 00       	mov    $0x11,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <unlink>:
SYSCALL(unlink)
 2e2:	b8 12 00 00 00       	mov    $0x12,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <fstat>:
SYSCALL(fstat)
 2ea:	b8 08 00 00 00       	mov    $0x8,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <link>:
SYSCALL(link)
 2f2:	b8 13 00 00 00       	mov    $0x13,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mkdir>:
SYSCALL(mkdir)
 2fa:	b8 14 00 00 00       	mov    $0x14,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <chdir>:
SYSCALL(chdir)
 302:	b8 09 00 00 00       	mov    $0x9,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <dup>:
SYSCALL(dup)
 30a:	b8 0a 00 00 00       	mov    $0xa,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <getpid>:
SYSCALL(getpid)
 312:	b8 0b 00 00 00       	mov    $0xb,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sbrk>:
SYSCALL(sbrk)
 31a:	b8 0c 00 00 00       	mov    $0xc,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sleep>:
SYSCALL(sleep)
 322:	b8 0d 00 00 00       	mov    $0xd,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <uptime>:
SYSCALL(uptime)
 32a:	b8 0e 00 00 00       	mov    $0xe,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 18             	sub    $0x18,%esp
 338:	8b 45 0c             	mov    0xc(%ebp),%eax
 33b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 33e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 345:	00 
 346:	8d 45 f4             	lea    -0xc(%ebp),%eax
 349:	89 44 24 04          	mov    %eax,0x4(%esp)
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	89 04 24             	mov    %eax,(%esp)
 353:	e8 5a ff ff ff       	call   2b2 <write>
}
 358:	c9                   	leave  
 359:	c3                   	ret    

0000035a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
 35f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 362:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 369:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 36d:	74 17                	je     386 <printint+0x2c>
 36f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 373:	79 11                	jns    386 <printint+0x2c>
    neg = 1;
 375:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 37c:	8b 45 0c             	mov    0xc(%ebp),%eax
 37f:	f7 d8                	neg    %eax
 381:	89 45 ec             	mov    %eax,-0x14(%ebp)
 384:	eb 06                	jmp    38c <printint+0x32>
  } else {
    x = xx;
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 38c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 393:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 396:	8d 41 01             	lea    0x1(%ecx),%eax
 399:	89 45 f4             	mov    %eax,-0xc(%ebp)
 39c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 39f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3a2:	ba 00 00 00 00       	mov    $0x0,%edx
 3a7:	f7 f3                	div    %ebx
 3a9:	89 d0                	mov    %edx,%eax
 3ab:	0f b6 80 2c 0a 00 00 	movzbl 0xa2c(%eax),%eax
 3b2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3b6:	8b 75 10             	mov    0x10(%ebp),%esi
 3b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3bc:	ba 00 00 00 00       	mov    $0x0,%edx
 3c1:	f7 f6                	div    %esi
 3c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3ca:	75 c7                	jne    393 <printint+0x39>
  if(neg)
 3cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3d0:	74 10                	je     3e2 <printint+0x88>
    buf[i++] = '-';
 3d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d5:	8d 50 01             	lea    0x1(%eax),%edx
 3d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3db:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3e0:	eb 1f                	jmp    401 <printint+0xa7>
 3e2:	eb 1d                	jmp    401 <printint+0xa7>
    putc(fd, buf[i]);
 3e4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ea:	01 d0                	add    %edx,%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	0f be c0             	movsbl %al,%eax
 3f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	89 04 24             	mov    %eax,(%esp)
 3fc:	e8 31 ff ff ff       	call   332 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 401:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 405:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 409:	79 d9                	jns    3e4 <printint+0x8a>
    putc(fd, buf[i]);
}
 40b:	83 c4 30             	add    $0x30,%esp
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    

00000412 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 418:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 41f:	8d 45 0c             	lea    0xc(%ebp),%eax
 422:	83 c0 04             	add    $0x4,%eax
 425:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 428:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 42f:	e9 7c 01 00 00       	jmp    5b0 <printf+0x19e>
    c = fmt[i] & 0xff;
 434:	8b 55 0c             	mov    0xc(%ebp),%edx
 437:	8b 45 f0             	mov    -0x10(%ebp),%eax
 43a:	01 d0                	add    %edx,%eax
 43c:	0f b6 00             	movzbl (%eax),%eax
 43f:	0f be c0             	movsbl %al,%eax
 442:	25 ff 00 00 00       	and    $0xff,%eax
 447:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 44a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 44e:	75 2c                	jne    47c <printf+0x6a>
      if(c == '%'){
 450:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 454:	75 0c                	jne    462 <printf+0x50>
        state = '%';
 456:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 45d:	e9 4a 01 00 00       	jmp    5ac <printf+0x19a>
      } else {
        putc(fd, c);
 462:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 465:	0f be c0             	movsbl %al,%eax
 468:	89 44 24 04          	mov    %eax,0x4(%esp)
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	89 04 24             	mov    %eax,(%esp)
 472:	e8 bb fe ff ff       	call   332 <putc>
 477:	e9 30 01 00 00       	jmp    5ac <printf+0x19a>
      }
    } else if(state == '%'){
 47c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 480:	0f 85 26 01 00 00    	jne    5ac <printf+0x19a>
      if(c == 'd'){
 486:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 48a:	75 2d                	jne    4b9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 48c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 48f:	8b 00                	mov    (%eax),%eax
 491:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 498:	00 
 499:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4a0:	00 
 4a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	89 04 24             	mov    %eax,(%esp)
 4ab:	e8 aa fe ff ff       	call   35a <printint>
        ap++;
 4b0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4b4:	e9 ec 00 00 00       	jmp    5a5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4b9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4bd:	74 06                	je     4c5 <printf+0xb3>
 4bf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4c3:	75 2d                	jne    4f2 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c8:	8b 00                	mov    (%eax),%eax
 4ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4d1:	00 
 4d2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4d9:	00 
 4da:	89 44 24 04          	mov    %eax,0x4(%esp)
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	89 04 24             	mov    %eax,(%esp)
 4e4:	e8 71 fe ff ff       	call   35a <printint>
        ap++;
 4e9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ed:	e9 b3 00 00 00       	jmp    5a5 <printf+0x193>
      } else if(c == 's'){
 4f2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4f6:	75 45                	jne    53d <printf+0x12b>
        s = (char*)*ap;
 4f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fb:	8b 00                	mov    (%eax),%eax
 4fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 500:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	75 09                	jne    513 <printf+0x101>
          s = "(null)";
 50a:	c7 45 f4 de 07 00 00 	movl   $0x7de,-0xc(%ebp)
        while(*s != 0){
 511:	eb 1e                	jmp    531 <printf+0x11f>
 513:	eb 1c                	jmp    531 <printf+0x11f>
          putc(fd, *s);
 515:	8b 45 f4             	mov    -0xc(%ebp),%eax
 518:	0f b6 00             	movzbl (%eax),%eax
 51b:	0f be c0             	movsbl %al,%eax
 51e:	89 44 24 04          	mov    %eax,0x4(%esp)
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	89 04 24             	mov    %eax,(%esp)
 528:	e8 05 fe ff ff       	call   332 <putc>
          s++;
 52d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 531:	8b 45 f4             	mov    -0xc(%ebp),%eax
 534:	0f b6 00             	movzbl (%eax),%eax
 537:	84 c0                	test   %al,%al
 539:	75 da                	jne    515 <printf+0x103>
 53b:	eb 68                	jmp    5a5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 541:	75 1d                	jne    560 <printf+0x14e>
        putc(fd, *ap);
 543:	8b 45 e8             	mov    -0x18(%ebp),%eax
 546:	8b 00                	mov    (%eax),%eax
 548:	0f be c0             	movsbl %al,%eax
 54b:	89 44 24 04          	mov    %eax,0x4(%esp)
 54f:	8b 45 08             	mov    0x8(%ebp),%eax
 552:	89 04 24             	mov    %eax,(%esp)
 555:	e8 d8 fd ff ff       	call   332 <putc>
        ap++;
 55a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 55e:	eb 45                	jmp    5a5 <printf+0x193>
      } else if(c == '%'){
 560:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 564:	75 17                	jne    57d <printf+0x16b>
        putc(fd, c);
 566:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 569:	0f be c0             	movsbl %al,%eax
 56c:	89 44 24 04          	mov    %eax,0x4(%esp)
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	89 04 24             	mov    %eax,(%esp)
 576:	e8 b7 fd ff ff       	call   332 <putc>
 57b:	eb 28                	jmp    5a5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 57d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 584:	00 
 585:	8b 45 08             	mov    0x8(%ebp),%eax
 588:	89 04 24             	mov    %eax,(%esp)
 58b:	e8 a2 fd ff ff       	call   332 <putc>
        putc(fd, c);
 590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 593:	0f be c0             	movsbl %al,%eax
 596:	89 44 24 04          	mov    %eax,0x4(%esp)
 59a:	8b 45 08             	mov    0x8(%ebp),%eax
 59d:	89 04 24             	mov    %eax,(%esp)
 5a0:	e8 8d fd ff ff       	call   332 <putc>
      }
      state = 0;
 5a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b6:	01 d0                	add    %edx,%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	84 c0                	test   %al,%al
 5bd:	0f 85 71 fe ff ff    	jne    434 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c3:	c9                   	leave  
 5c4:	c3                   	ret    

000005c5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	83 e8 08             	sub    $0x8,%eax
 5d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d4:	a1 48 0a 00 00       	mov    0xa48,%eax
 5d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5dc:	eb 24                	jmp    602 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e6:	77 12                	ja     5fa <free+0x35>
 5e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ee:	77 24                	ja     614 <free+0x4f>
 5f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f8:	77 1a                	ja     614 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fd:	8b 00                	mov    (%eax),%eax
 5ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
 602:	8b 45 f8             	mov    -0x8(%ebp),%eax
 605:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 608:	76 d4                	jbe    5de <free+0x19>
 60a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60d:	8b 00                	mov    (%eax),%eax
 60f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 612:	76 ca                	jbe    5de <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 614:	8b 45 f8             	mov    -0x8(%ebp),%eax
 617:	8b 40 04             	mov    0x4(%eax),%eax
 61a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 621:	8b 45 f8             	mov    -0x8(%ebp),%eax
 624:	01 c2                	add    %eax,%edx
 626:	8b 45 fc             	mov    -0x4(%ebp),%eax
 629:	8b 00                	mov    (%eax),%eax
 62b:	39 c2                	cmp    %eax,%edx
 62d:	75 24                	jne    653 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 62f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 632:	8b 50 04             	mov    0x4(%eax),%edx
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	8b 40 04             	mov    0x4(%eax),%eax
 63d:	01 c2                	add    %eax,%edx
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	8b 10                	mov    (%eax),%edx
 64c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64f:	89 10                	mov    %edx,(%eax)
 651:	eb 0a                	jmp    65d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 10                	mov    (%eax),%edx
 658:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 40 04             	mov    0x4(%eax),%eax
 663:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 66a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66d:	01 d0                	add    %edx,%eax
 66f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 672:	75 20                	jne    694 <free+0xcf>
    p->s.size += bp->s.size;
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 50 04             	mov    0x4(%eax),%edx
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	8b 40 04             	mov    0x4(%eax),%eax
 680:	01 c2                	add    %eax,%edx
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 688:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68b:	8b 10                	mov    (%eax),%edx
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	89 10                	mov    %edx,(%eax)
 692:	eb 08                	jmp    69c <free+0xd7>
  } else
    p->s.ptr = bp;
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 55 f8             	mov    -0x8(%ebp),%edx
 69a:	89 10                	mov    %edx,(%eax)
  freep = p;
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	a3 48 0a 00 00       	mov    %eax,0xa48
}
 6a4:	c9                   	leave  
 6a5:	c3                   	ret    

000006a6 <morecore>:

static Header*
morecore(uint nu)
{
 6a6:	55                   	push   %ebp
 6a7:	89 e5                	mov    %esp,%ebp
 6a9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6ac:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6b3:	77 07                	ja     6bc <morecore+0x16>
    nu = 4096;
 6b5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	c1 e0 03             	shl    $0x3,%eax
 6c2:	89 04 24             	mov    %eax,(%esp)
 6c5:	e8 50 fc ff ff       	call   31a <sbrk>
 6ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6cd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6d1:	75 07                	jne    6da <morecore+0x34>
    return 0;
 6d3:	b8 00 00 00 00       	mov    $0x0,%eax
 6d8:	eb 22                	jmp    6fc <morecore+0x56>
  hp = (Header*)p;
 6da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e3:	8b 55 08             	mov    0x8(%ebp),%edx
 6e6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ec:	83 c0 08             	add    $0x8,%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 ce fe ff ff       	call   5c5 <free>
  return freep;
 6f7:	a1 48 0a 00 00       	mov    0xa48,%eax
}
 6fc:	c9                   	leave  
 6fd:	c3                   	ret    

000006fe <malloc>:

void*
malloc(uint nbytes)
{
 6fe:	55                   	push   %ebp
 6ff:	89 e5                	mov    %esp,%ebp
 701:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	83 c0 07             	add    $0x7,%eax
 70a:	c1 e8 03             	shr    $0x3,%eax
 70d:	83 c0 01             	add    $0x1,%eax
 710:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 713:	a1 48 0a 00 00       	mov    0xa48,%eax
 718:	89 45 f0             	mov    %eax,-0x10(%ebp)
 71b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 71f:	75 23                	jne    744 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 721:	c7 45 f0 40 0a 00 00 	movl   $0xa40,-0x10(%ebp)
 728:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72b:	a3 48 0a 00 00       	mov    %eax,0xa48
 730:	a1 48 0a 00 00       	mov    0xa48,%eax
 735:	a3 40 0a 00 00       	mov    %eax,0xa40
    base.s.size = 0;
 73a:	c7 05 44 0a 00 00 00 	movl   $0x0,0xa44
 741:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 744:	8b 45 f0             	mov    -0x10(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 74c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74f:	8b 40 04             	mov    0x4(%eax),%eax
 752:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 755:	72 4d                	jb     7a4 <malloc+0xa6>
      if(p->s.size == nunits)
 757:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75a:	8b 40 04             	mov    0x4(%eax),%eax
 75d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 760:	75 0c                	jne    76e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	8b 10                	mov    (%eax),%edx
 767:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76a:	89 10                	mov    %edx,(%eax)
 76c:	eb 26                	jmp    794 <malloc+0x96>
      else {
        p->s.size -= nunits;
 76e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 771:	8b 40 04             	mov    0x4(%eax),%eax
 774:	2b 45 ec             	sub    -0x14(%ebp),%eax
 777:	89 c2                	mov    %eax,%edx
 779:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 77f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 782:	8b 40 04             	mov    0x4(%eax),%eax
 785:	c1 e0 03             	shl    $0x3,%eax
 788:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 78b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 791:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 794:	8b 45 f0             	mov    -0x10(%ebp),%eax
 797:	a3 48 0a 00 00       	mov    %eax,0xa48
      return (void*)(p + 1);
 79c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79f:	83 c0 08             	add    $0x8,%eax
 7a2:	eb 38                	jmp    7dc <malloc+0xde>
    }
    if(p == freep)
 7a4:	a1 48 0a 00 00       	mov    0xa48,%eax
 7a9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ac:	75 1b                	jne    7c9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b1:	89 04 24             	mov    %eax,(%esp)
 7b4:	e8 ed fe ff ff       	call   6a6 <morecore>
 7b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c0:	75 07                	jne    7c9 <malloc+0xcb>
        return 0;
 7c2:	b8 00 00 00 00       	mov    $0x0,%eax
 7c7:	eb 13                	jmp    7dc <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7d7:	e9 70 ff ff ff       	jmp    74c <malloc+0x4e>
}
 7dc:	c9                   	leave  
 7dd:	c3                   	ret    
