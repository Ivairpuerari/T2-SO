
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 cd 08 00 00 	movl   $0x8cd,(%esp)
  18:	e8 a1 03 00 00       	call   3be <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 cd 08 00 00 	movl   $0x8cd,(%esp)
  38:	e8 89 03 00 00       	call   3c6 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 cd 08 00 00 	movl   $0x8cd,(%esp)
  4c:	e8 6d 03 00 00       	call   3be <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 99 03 00 00       	call   3f6 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 8d 03 00 00       	call   3f6 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 d5 08 00 	movl   $0x8d5,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 81 04 00 00       	call   4fe <printf>
    pid = fork(500);
  7d:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
  84:	e8 ed 02 00 00       	call   376 <fork>
  89:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  8d:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  92:	79 19                	jns    ad <main+0xad>
      printf(1, "init: fork failed\n");
  94:	c7 44 24 04 e8 08 00 	movl   $0x8e8,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a3:	e8 56 04 00 00       	call   4fe <printf>
      exit();
  a8:	e8 d1 02 00 00       	call   37e <exit>
    }
    if(pid == 0){
  ad:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  b2:	75 2d                	jne    e1 <main+0xe1>
      exec("sh", argv);
  b4:	c7 44 24 04 68 0b 00 	movl   $0xb68,0x4(%esp)
  bb:	00 
  bc:	c7 04 24 ca 08 00 00 	movl   $0x8ca,(%esp)
  c3:	e8 ee 02 00 00       	call   3b6 <exec>
      printf(1, "init: exec sh failed\n");
  c8:	c7 44 24 04 fb 08 00 	movl   $0x8fb,0x4(%esp)
  cf:	00 
  d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d7:	e8 22 04 00 00       	call   4fe <printf>
      exit();
  dc:	e8 9d 02 00 00       	call   37e <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  e1:	eb 14                	jmp    f7 <main+0xf7>
      printf(1, "zombie!\n");
  e3:	c7 44 24 04 11 09 00 	movl   $0x911,0x4(%esp)
  ea:	00 
  eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f2:	e8 07 04 00 00       	call   4fe <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f7:	e8 8a 02 00 00       	call   386 <wait>
  fc:	89 44 24 18          	mov    %eax,0x18(%esp)
 100:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 105:	78 0a                	js     111 <main+0x111>
 107:	8b 44 24 18          	mov    0x18(%esp),%eax
 10b:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 10f:	75 d2                	jne    e3 <main+0xe3>
      printf(1, "zombie!\n");
  }
 111:	e9 53 ff ff ff       	jmp    69 <main+0x69>

00000116 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 116:	55                   	push   %ebp
 117:	89 e5                	mov    %esp,%ebp
 119:	57                   	push   %edi
 11a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11e:	8b 55 10             	mov    0x10(%ebp),%edx
 121:	8b 45 0c             	mov    0xc(%ebp),%eax
 124:	89 cb                	mov    %ecx,%ebx
 126:	89 df                	mov    %ebx,%edi
 128:	89 d1                	mov    %edx,%ecx
 12a:	fc                   	cld    
 12b:	f3 aa                	rep stos %al,%es:(%edi)
 12d:	89 ca                	mov    %ecx,%edx
 12f:	89 fb                	mov    %edi,%ebx
 131:	89 5d 08             	mov    %ebx,0x8(%ebp)
 134:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 137:	5b                   	pop    %ebx
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    

0000013b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 147:	90                   	nop
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	8d 50 01             	lea    0x1(%eax),%edx
 14e:	89 55 08             	mov    %edx,0x8(%ebp)
 151:	8b 55 0c             	mov    0xc(%ebp),%edx
 154:	8d 4a 01             	lea    0x1(%edx),%ecx
 157:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 15a:	0f b6 12             	movzbl (%edx),%edx
 15d:	88 10                	mov    %dl,(%eax)
 15f:	0f b6 00             	movzbl (%eax),%eax
 162:	84 c0                	test   %al,%al
 164:	75 e2                	jne    148 <strcpy+0xd>
    ;
  return os;
 166:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 169:	c9                   	leave  
 16a:	c3                   	ret    

0000016b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 16b:	55                   	push   %ebp
 16c:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16e:	eb 08                	jmp    178 <strcmp+0xd>
    p++, q++;
 170:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 174:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 00             	movzbl (%eax),%eax
 17e:	84 c0                	test   %al,%al
 180:	74 10                	je     192 <strcmp+0x27>
 182:	8b 45 08             	mov    0x8(%ebp),%eax
 185:	0f b6 10             	movzbl (%eax),%edx
 188:	8b 45 0c             	mov    0xc(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	38 c2                	cmp    %al,%dl
 190:	74 de                	je     170 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 192:	8b 45 08             	mov    0x8(%ebp),%eax
 195:	0f b6 00             	movzbl (%eax),%eax
 198:	0f b6 d0             	movzbl %al,%edx
 19b:	8b 45 0c             	mov    0xc(%ebp),%eax
 19e:	0f b6 00             	movzbl (%eax),%eax
 1a1:	0f b6 c0             	movzbl %al,%eax
 1a4:	29 c2                	sub    %eax,%edx
 1a6:	89 d0                	mov    %edx,%eax
}
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    

000001aa <strlen>:

uint
strlen(char *s)
{
 1aa:	55                   	push   %ebp
 1ab:	89 e5                	mov    %esp,%ebp
 1ad:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b7:	eb 04                	jmp    1bd <strlen+0x13>
 1b9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	01 d0                	add    %edx,%eax
 1c5:	0f b6 00             	movzbl (%eax),%eax
 1c8:	84 c0                	test   %al,%al
 1ca:	75 ed                	jne    1b9 <strlen+0xf>
    ;
  return n;
 1cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1cf:	c9                   	leave  
 1d0:	c3                   	ret    

000001d1 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d7:	8b 45 10             	mov    0x10(%ebp),%eax
 1da:	89 44 24 08          	mov    %eax,0x8(%esp)
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	89 04 24             	mov    %eax,(%esp)
 1eb:	e8 26 ff ff ff       	call   116 <stosb>
  return dst;
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    

000001f5 <strchr>:

char*
strchr(const char *s, char c)
{
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fe:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 201:	eb 14                	jmp    217 <strchr+0x22>
    if(*s == c)
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 00             	movzbl (%eax),%eax
 209:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20c:	75 05                	jne    213 <strchr+0x1e>
      return (char*)s;
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	eb 13                	jmp    226 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 213:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	0f b6 00             	movzbl (%eax),%eax
 21d:	84 c0                	test   %al,%al
 21f:	75 e2                	jne    203 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 221:	b8 00 00 00 00       	mov    $0x0,%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <gets>:

char*
gets(char *buf, int max)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 235:	eb 4c                	jmp    283 <gets+0x5b>
    cc = read(0, &c, 1);
 237:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23e:	00 
 23f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 242:	89 44 24 04          	mov    %eax,0x4(%esp)
 246:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24d:	e8 44 01 00 00       	call   396 <read>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 255:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 259:	7f 02                	jg     25d <gets+0x35>
      break;
 25b:	eb 31                	jmp    28e <gets+0x66>
    buf[i++] = c;
 25d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 260:	8d 50 01             	lea    0x1(%eax),%edx
 263:	89 55 f4             	mov    %edx,-0xc(%ebp)
 266:	89 c2                	mov    %eax,%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 c2                	add    %eax,%edx
 26d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 271:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 273:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 277:	3c 0a                	cmp    $0xa,%al
 279:	74 13                	je     28e <gets+0x66>
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	3c 0d                	cmp    $0xd,%al
 281:	74 0b                	je     28e <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 283:	8b 45 f4             	mov    -0xc(%ebp),%eax
 286:	83 c0 01             	add    $0x1,%eax
 289:	3b 45 0c             	cmp    0xc(%ebp),%eax
 28c:	7c a9                	jl     237 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 28e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 d0                	add    %edx,%eax
 296:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 299:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29c:	c9                   	leave  
 29d:	c3                   	ret    

0000029e <stat>:

int
stat(char *n, struct stat *st)
{
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ab:	00 
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	89 04 24             	mov    %eax,(%esp)
 2b2:	e8 07 01 00 00       	call   3be <open>
 2b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2be:	79 07                	jns    2c7 <stat+0x29>
    return -1;
 2c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c5:	eb 23                	jmp    2ea <stat+0x4c>
  r = fstat(fd, st);
 2c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d1:	89 04 24             	mov    %eax,(%esp)
 2d4:	e8 fd 00 00 00       	call   3d6 <fstat>
 2d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2df:	89 04 24             	mov    %eax,(%esp)
 2e2:	e8 bf 00 00 00       	call   3a6 <close>
  return r;
 2e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2ea:	c9                   	leave  
 2eb:	c3                   	ret    

000002ec <atoi>:

int
atoi(const char *s)
{
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f9:	eb 25                	jmp    320 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2fb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fe:	89 d0                	mov    %edx,%eax
 300:	c1 e0 02             	shl    $0x2,%eax
 303:	01 d0                	add    %edx,%eax
 305:	01 c0                	add    %eax,%eax
 307:	89 c1                	mov    %eax,%ecx
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	8d 50 01             	lea    0x1(%eax),%edx
 30f:	89 55 08             	mov    %edx,0x8(%ebp)
 312:	0f b6 00             	movzbl (%eax),%eax
 315:	0f be c0             	movsbl %al,%eax
 318:	01 c8                	add    %ecx,%eax
 31a:	83 e8 30             	sub    $0x30,%eax
 31d:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	0f b6 00             	movzbl (%eax),%eax
 326:	3c 2f                	cmp    $0x2f,%al
 328:	7e 0a                	jle    334 <atoi+0x48>
 32a:	8b 45 08             	mov    0x8(%ebp),%eax
 32d:	0f b6 00             	movzbl (%eax),%eax
 330:	3c 39                	cmp    $0x39,%al
 332:	7e c7                	jle    2fb <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 334:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 337:	c9                   	leave  
 338:	c3                   	ret    

00000339 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 33f:	8b 45 08             	mov    0x8(%ebp),%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 345:	8b 45 0c             	mov    0xc(%ebp),%eax
 348:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 34b:	eb 17                	jmp    364 <memmove+0x2b>
    *dst++ = *src++;
 34d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 350:	8d 50 01             	lea    0x1(%eax),%edx
 353:	89 55 fc             	mov    %edx,-0x4(%ebp)
 356:	8b 55 f8             	mov    -0x8(%ebp),%edx
 359:	8d 4a 01             	lea    0x1(%edx),%ecx
 35c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 35f:	0f b6 12             	movzbl (%edx),%edx
 362:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8d 50 ff             	lea    -0x1(%eax),%edx
 36a:	89 55 10             	mov    %edx,0x10(%ebp)
 36d:	85 c0                	test   %eax,%eax
 36f:	7f dc                	jg     34d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 371:	8b 45 08             	mov    0x8(%ebp),%eax
}
 374:	c9                   	leave  
 375:	c3                   	ret    

00000376 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 376:	b8 01 00 00 00       	mov    $0x1,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <exit>:
SYSCALL(exit)
 37e:	b8 02 00 00 00       	mov    $0x2,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <wait>:
SYSCALL(wait)
 386:	b8 03 00 00 00       	mov    $0x3,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <pipe>:
SYSCALL(pipe)
 38e:	b8 04 00 00 00       	mov    $0x4,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <read>:
SYSCALL(read)
 396:	b8 05 00 00 00       	mov    $0x5,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <write>:
SYSCALL(write)
 39e:	b8 10 00 00 00       	mov    $0x10,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <close>:
SYSCALL(close)
 3a6:	b8 15 00 00 00       	mov    $0x15,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <kill>:
SYSCALL(kill)
 3ae:	b8 06 00 00 00       	mov    $0x6,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <exec>:
SYSCALL(exec)
 3b6:	b8 07 00 00 00       	mov    $0x7,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <open>:
SYSCALL(open)
 3be:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <mknod>:
SYSCALL(mknod)
 3c6:	b8 11 00 00 00       	mov    $0x11,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <unlink>:
SYSCALL(unlink)
 3ce:	b8 12 00 00 00       	mov    $0x12,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <fstat>:
SYSCALL(fstat)
 3d6:	b8 08 00 00 00       	mov    $0x8,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <link>:
SYSCALL(link)
 3de:	b8 13 00 00 00       	mov    $0x13,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <mkdir>:
SYSCALL(mkdir)
 3e6:	b8 14 00 00 00       	mov    $0x14,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <chdir>:
SYSCALL(chdir)
 3ee:	b8 09 00 00 00       	mov    $0x9,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <dup>:
SYSCALL(dup)
 3f6:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <getpid>:
SYSCALL(getpid)
 3fe:	b8 0b 00 00 00       	mov    $0xb,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <sbrk>:
SYSCALL(sbrk)
 406:	b8 0c 00 00 00       	mov    $0xc,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sleep>:
SYSCALL(sleep)
 40e:	b8 0d 00 00 00       	mov    $0xd,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <uptime>:
SYSCALL(uptime)
 416:	b8 0e 00 00 00       	mov    $0xe,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	83 ec 18             	sub    $0x18,%esp
 424:	8b 45 0c             	mov    0xc(%ebp),%eax
 427:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 42a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 431:	00 
 432:	8d 45 f4             	lea    -0xc(%ebp),%eax
 435:	89 44 24 04          	mov    %eax,0x4(%esp)
 439:	8b 45 08             	mov    0x8(%ebp),%eax
 43c:	89 04 24             	mov    %eax,(%esp)
 43f:	e8 5a ff ff ff       	call   39e <write>
}
 444:	c9                   	leave  
 445:	c3                   	ret    

00000446 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	56                   	push   %esi
 44a:	53                   	push   %ebx
 44b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 44e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 455:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 459:	74 17                	je     472 <printint+0x2c>
 45b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 45f:	79 11                	jns    472 <printint+0x2c>
    neg = 1;
 461:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 468:	8b 45 0c             	mov    0xc(%ebp),%eax
 46b:	f7 d8                	neg    %eax
 46d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 470:	eb 06                	jmp    478 <printint+0x32>
  } else {
    x = xx;
 472:	8b 45 0c             	mov    0xc(%ebp),%eax
 475:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 47f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 482:	8d 41 01             	lea    0x1(%ecx),%eax
 485:	89 45 f4             	mov    %eax,-0xc(%ebp)
 488:	8b 5d 10             	mov    0x10(%ebp),%ebx
 48b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 48e:	ba 00 00 00 00       	mov    $0x0,%edx
 493:	f7 f3                	div    %ebx
 495:	89 d0                	mov    %edx,%eax
 497:	0f b6 80 70 0b 00 00 	movzbl 0xb70(%eax),%eax
 49e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4a2:	8b 75 10             	mov    0x10(%ebp),%esi
 4a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a8:	ba 00 00 00 00       	mov    $0x0,%edx
 4ad:	f7 f6                	div    %esi
 4af:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b6:	75 c7                	jne    47f <printint+0x39>
  if(neg)
 4b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4bc:	74 10                	je     4ce <printint+0x88>
    buf[i++] = '-';
 4be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c1:	8d 50 01             	lea    0x1(%eax),%edx
 4c4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4c7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4cc:	eb 1f                	jmp    4ed <printint+0xa7>
 4ce:	eb 1d                	jmp    4ed <printint+0xa7>
    putc(fd, buf[i]);
 4d0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d6:	01 d0                	add    %edx,%eax
 4d8:	0f b6 00             	movzbl (%eax),%eax
 4db:	0f be c0             	movsbl %al,%eax
 4de:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	89 04 24             	mov    %eax,(%esp)
 4e8:	e8 31 ff ff ff       	call   41e <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ed:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4f1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f5:	79 d9                	jns    4d0 <printint+0x8a>
    putc(fd, buf[i]);
}
 4f7:	83 c4 30             	add    $0x30,%esp
 4fa:	5b                   	pop    %ebx
 4fb:	5e                   	pop    %esi
 4fc:	5d                   	pop    %ebp
 4fd:	c3                   	ret    

000004fe <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4fe:	55                   	push   %ebp
 4ff:	89 e5                	mov    %esp,%ebp
 501:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 504:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 50b:	8d 45 0c             	lea    0xc(%ebp),%eax
 50e:	83 c0 04             	add    $0x4,%eax
 511:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 514:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 51b:	e9 7c 01 00 00       	jmp    69c <printf+0x19e>
    c = fmt[i] & 0xff;
 520:	8b 55 0c             	mov    0xc(%ebp),%edx
 523:	8b 45 f0             	mov    -0x10(%ebp),%eax
 526:	01 d0                	add    %edx,%eax
 528:	0f b6 00             	movzbl (%eax),%eax
 52b:	0f be c0             	movsbl %al,%eax
 52e:	25 ff 00 00 00       	and    $0xff,%eax
 533:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 536:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 53a:	75 2c                	jne    568 <printf+0x6a>
      if(c == '%'){
 53c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 540:	75 0c                	jne    54e <printf+0x50>
        state = '%';
 542:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 549:	e9 4a 01 00 00       	jmp    698 <printf+0x19a>
      } else {
        putc(fd, c);
 54e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 bb fe ff ff       	call   41e <putc>
 563:	e9 30 01 00 00       	jmp    698 <printf+0x19a>
      }
    } else if(state == '%'){
 568:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 56c:	0f 85 26 01 00 00    	jne    698 <printf+0x19a>
      if(c == 'd'){
 572:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 576:	75 2d                	jne    5a5 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 578:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57b:	8b 00                	mov    (%eax),%eax
 57d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 584:	00 
 585:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 58c:	00 
 58d:	89 44 24 04          	mov    %eax,0x4(%esp)
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	89 04 24             	mov    %eax,(%esp)
 597:	e8 aa fe ff ff       	call   446 <printint>
        ap++;
 59c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5a0:	e9 ec 00 00 00       	jmp    691 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5a5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5a9:	74 06                	je     5b1 <printf+0xb3>
 5ab:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5af:	75 2d                	jne    5de <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b4:	8b 00                	mov    (%eax),%eax
 5b6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5bd:	00 
 5be:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5c5:	00 
 5c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 71 fe ff ff       	call   446 <printint>
        ap++;
 5d5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d9:	e9 b3 00 00 00       	jmp    691 <printf+0x193>
      } else if(c == 's'){
 5de:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5e2:	75 45                	jne    629 <printf+0x12b>
        s = (char*)*ap;
 5e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e7:	8b 00                	mov    (%eax),%eax
 5e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5ec:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5f4:	75 09                	jne    5ff <printf+0x101>
          s = "(null)";
 5f6:	c7 45 f4 1a 09 00 00 	movl   $0x91a,-0xc(%ebp)
        while(*s != 0){
 5fd:	eb 1e                	jmp    61d <printf+0x11f>
 5ff:	eb 1c                	jmp    61d <printf+0x11f>
          putc(fd, *s);
 601:	8b 45 f4             	mov    -0xc(%ebp),%eax
 604:	0f b6 00             	movzbl (%eax),%eax
 607:	0f be c0             	movsbl %al,%eax
 60a:	89 44 24 04          	mov    %eax,0x4(%esp)
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	89 04 24             	mov    %eax,(%esp)
 614:	e8 05 fe ff ff       	call   41e <putc>
          s++;
 619:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 61d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 620:	0f b6 00             	movzbl (%eax),%eax
 623:	84 c0                	test   %al,%al
 625:	75 da                	jne    601 <printf+0x103>
 627:	eb 68                	jmp    691 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 629:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 62d:	75 1d                	jne    64c <printf+0x14e>
        putc(fd, *ap);
 62f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 632:	8b 00                	mov    (%eax),%eax
 634:	0f be c0             	movsbl %al,%eax
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 d8 fd ff ff       	call   41e <putc>
        ap++;
 646:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64a:	eb 45                	jmp    691 <printf+0x193>
      } else if(c == '%'){
 64c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 650:	75 17                	jne    669 <printf+0x16b>
        putc(fd, c);
 652:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 b7 fd ff ff       	call   41e <putc>
 667:	eb 28                	jmp    691 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 669:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 670:	00 
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	89 04 24             	mov    %eax,(%esp)
 677:	e8 a2 fd ff ff       	call   41e <putc>
        putc(fd, c);
 67c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67f:	0f be c0             	movsbl %al,%eax
 682:	89 44 24 04          	mov    %eax,0x4(%esp)
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	89 04 24             	mov    %eax,(%esp)
 68c:	e8 8d fd ff ff       	call   41e <putc>
      }
      state = 0;
 691:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 698:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 69c:	8b 55 0c             	mov    0xc(%ebp),%edx
 69f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a2:	01 d0                	add    %edx,%eax
 6a4:	0f b6 00             	movzbl (%eax),%eax
 6a7:	84 c0                	test   %al,%al
 6a9:	0f 85 71 fe ff ff    	jne    520 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6af:	c9                   	leave  
 6b0:	c3                   	ret    

000006b1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b1:	55                   	push   %ebp
 6b2:	89 e5                	mov    %esp,%ebp
 6b4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	83 e8 08             	sub    $0x8,%eax
 6bd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c0:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 6c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6c8:	eb 24                	jmp    6ee <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	8b 00                	mov    (%eax),%eax
 6cf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d2:	77 12                	ja     6e6 <free+0x35>
 6d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6da:	77 24                	ja     700 <free+0x4f>
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	8b 00                	mov    (%eax),%eax
 6e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e4:	77 1a                	ja     700 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e9:	8b 00                	mov    (%eax),%eax
 6eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f4:	76 d4                	jbe    6ca <free+0x19>
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 00                	mov    (%eax),%eax
 6fb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fe:	76 ca                	jbe    6ca <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 700:	8b 45 f8             	mov    -0x8(%ebp),%eax
 703:	8b 40 04             	mov    0x4(%eax),%eax
 706:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 70d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 710:	01 c2                	add    %eax,%edx
 712:	8b 45 fc             	mov    -0x4(%ebp),%eax
 715:	8b 00                	mov    (%eax),%eax
 717:	39 c2                	cmp    %eax,%edx
 719:	75 24                	jne    73f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 71b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71e:	8b 50 04             	mov    0x4(%eax),%edx
 721:	8b 45 fc             	mov    -0x4(%ebp),%eax
 724:	8b 00                	mov    (%eax),%eax
 726:	8b 40 04             	mov    0x4(%eax),%eax
 729:	01 c2                	add    %eax,%edx
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	8b 00                	mov    (%eax),%eax
 736:	8b 10                	mov    (%eax),%edx
 738:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73b:	89 10                	mov    %edx,(%eax)
 73d:	eb 0a                	jmp    749 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	8b 10                	mov    (%eax),%edx
 744:	8b 45 f8             	mov    -0x8(%ebp),%eax
 747:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	8b 40 04             	mov    0x4(%eax),%eax
 74f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	01 d0                	add    %edx,%eax
 75b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75e:	75 20                	jne    780 <free+0xcf>
    p->s.size += bp->s.size;
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 50 04             	mov    0x4(%eax),%edx
 766:	8b 45 f8             	mov    -0x8(%ebp),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	01 c2                	add    %eax,%edx
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 774:	8b 45 f8             	mov    -0x8(%ebp),%eax
 777:	8b 10                	mov    (%eax),%edx
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	89 10                	mov    %edx,(%eax)
 77e:	eb 08                	jmp    788 <free+0xd7>
  } else
    p->s.ptr = bp;
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 55 f8             	mov    -0x8(%ebp),%edx
 786:	89 10                	mov    %edx,(%eax)
  freep = p;
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	a3 8c 0b 00 00       	mov    %eax,0xb8c
}
 790:	c9                   	leave  
 791:	c3                   	ret    

00000792 <morecore>:

static Header*
morecore(uint nu)
{
 792:	55                   	push   %ebp
 793:	89 e5                	mov    %esp,%ebp
 795:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 798:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 79f:	77 07                	ja     7a8 <morecore+0x16>
    nu = 4096;
 7a1:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	c1 e0 03             	shl    $0x3,%eax
 7ae:	89 04 24             	mov    %eax,(%esp)
 7b1:	e8 50 fc ff ff       	call   406 <sbrk>
 7b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7b9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7bd:	75 07                	jne    7c6 <morecore+0x34>
    return 0;
 7bf:	b8 00 00 00 00       	mov    $0x0,%eax
 7c4:	eb 22                	jmp    7e8 <morecore+0x56>
  hp = (Header*)p;
 7c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	8b 55 08             	mov    0x8(%ebp),%edx
 7d2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d8:	83 c0 08             	add    $0x8,%eax
 7db:	89 04 24             	mov    %eax,(%esp)
 7de:	e8 ce fe ff ff       	call   6b1 <free>
  return freep;
 7e3:	a1 8c 0b 00 00       	mov    0xb8c,%eax
}
 7e8:	c9                   	leave  
 7e9:	c3                   	ret    

000007ea <malloc>:

void*
malloc(uint nbytes)
{
 7ea:	55                   	push   %ebp
 7eb:	89 e5                	mov    %esp,%ebp
 7ed:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	83 c0 07             	add    $0x7,%eax
 7f6:	c1 e8 03             	shr    $0x3,%eax
 7f9:	83 c0 01             	add    $0x1,%eax
 7fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7ff:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 804:	89 45 f0             	mov    %eax,-0x10(%ebp)
 807:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80b:	75 23                	jne    830 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 80d:	c7 45 f0 84 0b 00 00 	movl   $0xb84,-0x10(%ebp)
 814:	8b 45 f0             	mov    -0x10(%ebp),%eax
 817:	a3 8c 0b 00 00       	mov    %eax,0xb8c
 81c:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 821:	a3 84 0b 00 00       	mov    %eax,0xb84
    base.s.size = 0;
 826:	c7 05 88 0b 00 00 00 	movl   $0x0,0xb88
 82d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 45 f0             	mov    -0x10(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	8b 40 04             	mov    0x4(%eax),%eax
 83e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 841:	72 4d                	jb     890 <malloc+0xa6>
      if(p->s.size == nunits)
 843:	8b 45 f4             	mov    -0xc(%ebp),%eax
 846:	8b 40 04             	mov    0x4(%eax),%eax
 849:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 84c:	75 0c                	jne    85a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 851:	8b 10                	mov    (%eax),%edx
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	89 10                	mov    %edx,(%eax)
 858:	eb 26                	jmp    880 <malloc+0x96>
      else {
        p->s.size -= nunits;
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	8b 40 04             	mov    0x4(%eax),%eax
 860:	2b 45 ec             	sub    -0x14(%ebp),%eax
 863:	89 c2                	mov    %eax,%edx
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	c1 e0 03             	shl    $0x3,%eax
 874:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 877:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 87d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 880:	8b 45 f0             	mov    -0x10(%ebp),%eax
 883:	a3 8c 0b 00 00       	mov    %eax,0xb8c
      return (void*)(p + 1);
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	83 c0 08             	add    $0x8,%eax
 88e:	eb 38                	jmp    8c8 <malloc+0xde>
    }
    if(p == freep)
 890:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 895:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 898:	75 1b                	jne    8b5 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 89a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 89d:	89 04 24             	mov    %eax,(%esp)
 8a0:	e8 ed fe ff ff       	call   792 <morecore>
 8a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ac:	75 07                	jne    8b5 <malloc+0xcb>
        return 0;
 8ae:	b8 00 00 00 00       	mov    $0x0,%eax
 8b3:	eb 13                	jmp    8c8 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8be:	8b 00                	mov    (%eax),%eax
 8c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8c3:	e9 70 ff ff ff       	jmp    838 <malloc+0x4e>
}
 8c8:	c9                   	leave  
 8c9:	c3                   	ret    
