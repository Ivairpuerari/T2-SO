
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	89 04 24             	mov    %eax,(%esp)
   c:	e8 9f 01 00 00       	call   1b0 <strlen>
  11:	89 44 24 08          	mov    %eax,0x8(%esp)
  15:	8b 45 0c             	mov    0xc(%ebp),%eax
  18:	89 44 24 04          	mov    %eax,0x4(%esp)
  1c:	8b 45 08             	mov    0x8(%ebp),%eax
  1f:	89 04 24             	mov    %eax,(%esp)
  22:	e8 7d 03 00 00       	call   3a4 <write>
}
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	c7 44 24 04 24 04 00 	movl   $0x424,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 bd ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  4a:	eb 26                	jmp    72 <forktest+0x49>
    pid = fork(10);
  4c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  53:	e8 24 03 00 00       	call   37c <fork>
  58:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  5b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  5f:	79 02                	jns    63 <forktest+0x3a>
      break;
  61:	eb 18                	jmp    7b <forktest+0x52>
    if(pid == 0)
  63:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  67:	75 05                	jne    6e <forktest+0x45>
      exit();
  69:	e8 16 03 00 00       	call   384 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  72:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  79:	7e d1                	jle    4c <forktest+0x23>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == N){
  7b:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  82:	75 21                	jne    a5 <forktest+0x7c>
    printf(1, "fork claimed to work N times!\n", N);
  84:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  8b:	00 
  8c:	c7 44 24 04 30 04 00 	movl   $0x430,0x4(%esp)
  93:	00 
  94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9b:	e8 60 ff ff ff       	call   0 <printf>
    exit();
  a0:	e8 df 02 00 00       	call   384 <exit>
  }
  
  for(; n > 0; n--){
  a5:	eb 26                	jmp    cd <forktest+0xa4>
    if(wait() < 0){
  a7:	e8 e0 02 00 00       	call   38c <wait>
  ac:	85 c0                	test   %eax,%eax
  ae:	79 19                	jns    c9 <forktest+0xa0>
      printf(1, "wait stopped early\n");
  b0:	c7 44 24 04 4f 04 00 	movl   $0x44f,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bf:	e8 3c ff ff ff       	call   0 <printf>
      exit();
  c4:	e8 bb 02 00 00       	call   384 <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  c9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  d1:	7f d4                	jg     a7 <forktest+0x7e>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  d3:	e8 b4 02 00 00       	call   38c <wait>
  d8:	83 f8 ff             	cmp    $0xffffffff,%eax
  db:	74 19                	je     f6 <forktest+0xcd>
    printf(1, "wait got too many\n");
  dd:	c7 44 24 04 63 04 00 	movl   $0x463,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 0f ff ff ff       	call   0 <printf>
    exit();
  f1:	e8 8e 02 00 00       	call   384 <exit>
  }
  
  printf(1, "fork test OK\n");
  f6:	c7 44 24 04 76 04 00 	movl   $0x476,0x4(%esp)
  fd:	00 
  fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 105:	e8 f6 fe ff ff       	call   0 <printf>
}
 10a:	c9                   	leave  
 10b:	c3                   	ret    

0000010c <main>:

int
main(void)
{
 10c:	55                   	push   %ebp
 10d:	89 e5                	mov    %esp,%ebp
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
 112:	e8 12 ff ff ff       	call   29 <forktest>
  exit();
 117:	e8 68 02 00 00       	call   384 <exit>

0000011c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 10             	mov    0x10(%ebp),%edx
 127:	8b 45 0c             	mov    0xc(%ebp),%eax
 12a:	89 cb                	mov    %ecx,%ebx
 12c:	89 df                	mov    %ebx,%edi
 12e:	89 d1                	mov    %edx,%ecx
 130:	fc                   	cld    
 131:	f3 aa                	rep stos %al,%es:(%edi)
 133:	89 ca                	mov    %ecx,%edx
 135:	89 fb                	mov    %edi,%ebx
 137:	89 5d 08             	mov    %ebx,0x8(%ebp)
 13a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 13d:	5b                   	pop    %ebx
 13e:	5f                   	pop    %edi
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    

00000141 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 14d:	90                   	nop
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	8d 50 01             	lea    0x1(%eax),%edx
 154:	89 55 08             	mov    %edx,0x8(%ebp)
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
 15a:	8d 4a 01             	lea    0x1(%edx),%ecx
 15d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 160:	0f b6 12             	movzbl (%edx),%edx
 163:	88 10                	mov    %dl,(%eax)
 165:	0f b6 00             	movzbl (%eax),%eax
 168:	84 c0                	test   %al,%al
 16a:	75 e2                	jne    14e <strcpy+0xd>
    ;
  return os;
 16c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 16f:	c9                   	leave  
 170:	c3                   	ret    

00000171 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 171:	55                   	push   %ebp
 172:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 174:	eb 08                	jmp    17e <strcmp+0xd>
    p++, q++;
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	84 c0                	test   %al,%al
 186:	74 10                	je     198 <strcmp+0x27>
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 10             	movzbl (%eax),%edx
 18e:	8b 45 0c             	mov    0xc(%ebp),%eax
 191:	0f b6 00             	movzbl (%eax),%eax
 194:	38 c2                	cmp    %al,%dl
 196:	74 de                	je     176 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	0f b6 00             	movzbl (%eax),%eax
 19e:	0f b6 d0             	movzbl %al,%edx
 1a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a4:	0f b6 00             	movzbl (%eax),%eax
 1a7:	0f b6 c0             	movzbl %al,%eax
 1aa:	29 c2                	sub    %eax,%edx
 1ac:	89 d0                	mov    %edx,%eax
}
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <strlen>:

uint
strlen(char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1bd:	eb 04                	jmp    1c3 <strlen+0x13>
 1bf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c6:	8b 45 08             	mov    0x8(%ebp),%eax
 1c9:	01 d0                	add    %edx,%eax
 1cb:	0f b6 00             	movzbl (%eax),%eax
 1ce:	84 c0                	test   %al,%al
 1d0:	75 ed                	jne    1bf <strlen+0xf>
    ;
  return n;
 1d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d5:	c9                   	leave  
 1d6:	c3                   	ret    

000001d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1dd:	8b 45 10             	mov    0x10(%ebp),%eax
 1e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	89 04 24             	mov    %eax,(%esp)
 1f1:	e8 26 ff ff ff       	call   11c <stosb>
  return dst;
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f9:	c9                   	leave  
 1fa:	c3                   	ret    

000001fb <strchr>:

char*
strchr(const char *s, char c)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	83 ec 04             	sub    $0x4,%esp
 201:	8b 45 0c             	mov    0xc(%ebp),%eax
 204:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 207:	eb 14                	jmp    21d <strchr+0x22>
    if(*s == c)
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 212:	75 05                	jne    219 <strchr+0x1e>
      return (char*)s;
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	eb 13                	jmp    22c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 219:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	0f b6 00             	movzbl (%eax),%eax
 223:	84 c0                	test   %al,%al
 225:	75 e2                	jne    209 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 227:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <gets>:

char*
gets(char *buf, int max)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
 231:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 234:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23b:	eb 4c                	jmp    289 <gets+0x5b>
    cc = read(0, &c, 1);
 23d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 244:	00 
 245:	8d 45 ef             	lea    -0x11(%ebp),%eax
 248:	89 44 24 04          	mov    %eax,0x4(%esp)
 24c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 253:	e8 44 01 00 00       	call   39c <read>
 258:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 25b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 25f:	7f 02                	jg     263 <gets+0x35>
      break;
 261:	eb 31                	jmp    294 <gets+0x66>
    buf[i++] = c;
 263:	8b 45 f4             	mov    -0xc(%ebp),%eax
 266:	8d 50 01             	lea    0x1(%eax),%edx
 269:	89 55 f4             	mov    %edx,-0xc(%ebp)
 26c:	89 c2                	mov    %eax,%edx
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	01 c2                	add    %eax,%edx
 273:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 277:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 279:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27d:	3c 0a                	cmp    $0xa,%al
 27f:	74 13                	je     294 <gets+0x66>
 281:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 285:	3c 0d                	cmp    $0xd,%al
 287:	74 0b                	je     294 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 289:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 292:	7c a9                	jl     23d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 294:	8b 55 f4             	mov    -0xc(%ebp),%edx
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	01 d0                	add    %edx,%eax
 29c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a2:	c9                   	leave  
 2a3:	c3                   	ret    

000002a4 <stat>:

int
stat(char *n, struct stat *st)
{
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2aa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b1:	00 
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	89 04 24             	mov    %eax,(%esp)
 2b8:	e8 07 01 00 00       	call   3c4 <open>
 2bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c4:	79 07                	jns    2cd <stat+0x29>
    return -1;
 2c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cb:	eb 23                	jmp    2f0 <stat+0x4c>
  r = fstat(fd, st);
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d7:	89 04 24             	mov    %eax,(%esp)
 2da:	e8 fd 00 00 00       	call   3dc <fstat>
 2df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e5:	89 04 24             	mov    %eax,(%esp)
 2e8:	e8 bf 00 00 00       	call   3ac <close>
  return r;
 2ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f0:	c9                   	leave  
 2f1:	c3                   	ret    

000002f2 <atoi>:

int
atoi(const char *s)
{
 2f2:	55                   	push   %ebp
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2ff:	eb 25                	jmp    326 <atoi+0x34>
    n = n*10 + *s++ - '0';
 301:	8b 55 fc             	mov    -0x4(%ebp),%edx
 304:	89 d0                	mov    %edx,%eax
 306:	c1 e0 02             	shl    $0x2,%eax
 309:	01 d0                	add    %edx,%eax
 30b:	01 c0                	add    %eax,%eax
 30d:	89 c1                	mov    %eax,%ecx
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	8d 50 01             	lea    0x1(%eax),%edx
 315:	89 55 08             	mov    %edx,0x8(%ebp)
 318:	0f b6 00             	movzbl (%eax),%eax
 31b:	0f be c0             	movsbl %al,%eax
 31e:	01 c8                	add    %ecx,%eax
 320:	83 e8 30             	sub    $0x30,%eax
 323:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	0f b6 00             	movzbl (%eax),%eax
 32c:	3c 2f                	cmp    $0x2f,%al
 32e:	7e 0a                	jle    33a <atoi+0x48>
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	0f b6 00             	movzbl (%eax),%eax
 336:	3c 39                	cmp    $0x39,%al
 338:	7e c7                	jle    301 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 33a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33d:	c9                   	leave  
 33e:	c3                   	ret    

0000033f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 33f:	55                   	push   %ebp
 340:	89 e5                	mov    %esp,%ebp
 342:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 34b:	8b 45 0c             	mov    0xc(%ebp),%eax
 34e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 351:	eb 17                	jmp    36a <memmove+0x2b>
    *dst++ = *src++;
 353:	8b 45 fc             	mov    -0x4(%ebp),%eax
 356:	8d 50 01             	lea    0x1(%eax),%edx
 359:	89 55 fc             	mov    %edx,-0x4(%ebp)
 35c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 35f:	8d 4a 01             	lea    0x1(%edx),%ecx
 362:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 365:	0f b6 12             	movzbl (%edx),%edx
 368:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36a:	8b 45 10             	mov    0x10(%ebp),%eax
 36d:	8d 50 ff             	lea    -0x1(%eax),%edx
 370:	89 55 10             	mov    %edx,0x10(%ebp)
 373:	85 c0                	test   %eax,%eax
 375:	7f dc                	jg     353 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 377:	8b 45 08             	mov    0x8(%ebp),%eax
}
 37a:	c9                   	leave  
 37b:	c3                   	ret    

0000037c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37c:	b8 01 00 00 00       	mov    $0x1,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <exit>:
SYSCALL(exit)
 384:	b8 02 00 00 00       	mov    $0x2,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <wait>:
SYSCALL(wait)
 38c:	b8 03 00 00 00       	mov    $0x3,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <pipe>:
SYSCALL(pipe)
 394:	b8 04 00 00 00       	mov    $0x4,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <read>:
SYSCALL(read)
 39c:	b8 05 00 00 00       	mov    $0x5,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <write>:
SYSCALL(write)
 3a4:	b8 10 00 00 00       	mov    $0x10,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <close>:
SYSCALL(close)
 3ac:	b8 15 00 00 00       	mov    $0x15,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <kill>:
SYSCALL(kill)
 3b4:	b8 06 00 00 00       	mov    $0x6,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <exec>:
SYSCALL(exec)
 3bc:	b8 07 00 00 00       	mov    $0x7,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <open>:
SYSCALL(open)
 3c4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <mknod>:
SYSCALL(mknod)
 3cc:	b8 11 00 00 00       	mov    $0x11,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <unlink>:
SYSCALL(unlink)
 3d4:	b8 12 00 00 00       	mov    $0x12,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <fstat>:
SYSCALL(fstat)
 3dc:	b8 08 00 00 00       	mov    $0x8,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <link>:
SYSCALL(link)
 3e4:	b8 13 00 00 00       	mov    $0x13,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <mkdir>:
SYSCALL(mkdir)
 3ec:	b8 14 00 00 00       	mov    $0x14,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <chdir>:
SYSCALL(chdir)
 3f4:	b8 09 00 00 00       	mov    $0x9,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <dup>:
SYSCALL(dup)
 3fc:	b8 0a 00 00 00       	mov    $0xa,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <getpid>:
SYSCALL(getpid)
 404:	b8 0b 00 00 00       	mov    $0xb,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sbrk>:
SYSCALL(sbrk)
 40c:	b8 0c 00 00 00       	mov    $0xc,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sleep>:
SYSCALL(sleep)
 414:	b8 0d 00 00 00       	mov    $0xd,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <uptime>:
SYSCALL(uptime)
 41c:	b8 0e 00 00 00       	mov    $0xe,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    
