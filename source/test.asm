
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "traps.h"
#include "memlayout.h"

#define OUT 1

int main(){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	int i,pid, k, j;
	for(i = 0 ; i < 3; i++){
   9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10:	00 
  11:	eb 55                	jmp    68 <main+0x68>
		pid = fork( 500 + i);
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	05 f4 01 00 00       	add    $0x1f4,%eax
  1c:	89 04 24             	mov    %eax,(%esp)
  1f:	e8 ed 02 00 00       	call   311 <fork>
  24:	89 44 24 10          	mov    %eax,0x10(%esp)
                if(!pid){
  28:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  2d:	75 34                	jne    63 <main+0x63>
			for(j=0; j < 10; j++)for(k=0; k < 10000000; k++);
  2f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  36:	00 
  37:	eb 1e                	jmp    57 <main+0x57>
  39:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  40:	00 
  41:	eb 05                	jmp    48 <main+0x48>
  43:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
  48:	81 7c 24 18 7f 96 98 	cmpl   $0x98967f,0x18(%esp)
  4f:	00 
  50:	7e f1                	jle    43 <main+0x43>
  52:	83 44 24 14 01       	addl   $0x1,0x14(%esp)
  57:	83 7c 24 14 09       	cmpl   $0x9,0x14(%esp)
  5c:	7e db                	jle    39 <main+0x39>
			exit();
  5e:	e8 b6 02 00 00       	call   319 <exit>

#define OUT 1

int main(){
	int i,pid, k, j;
	for(i = 0 ; i < 3; i++){
  63:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  68:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
  6d:	7e a4                	jle    13 <main+0x13>
                if(!pid){
			for(j=0; j < 10; j++)for(k=0; k < 10000000; k++);
			exit();
		}
	}
	for(i = 0 ; i < 3; i++){
  6f:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  76:	00 
  77:	eb 2a                	jmp    a3 <main+0xa3>
		pid=wait();
  79:	e8 a3 02 00 00       	call   321 <wait>
  7e:	89 44 24 10          	mov    %eax,0x10(%esp)
		printf(OUT,"Filho %d finalisou\n",pid );
  82:	8b 44 24 10          	mov    0x10(%esp),%eax
  86:	89 44 24 08          	mov    %eax,0x8(%esp)
  8a:	c7 44 24 04 65 08 00 	movl   $0x865,0x4(%esp)
  91:	00 
  92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  99:	e8 fb 03 00 00       	call   499 <printf>
                if(!pid){
			for(j=0; j < 10; j++)for(k=0; k < 10000000; k++);
			exit();
		}
	}
	for(i = 0 ; i < 3; i++){
  9e:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  a3:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
  a8:	7e cf                	jle    79 <main+0x79>
		pid=wait();
		printf(OUT,"Filho %d finalisou\n",pid );
	}
	
	return 1;
  aa:	b8 01 00 00 00       	mov    $0x1,%eax
}
  af:	c9                   	leave  
  b0:	c3                   	ret    

000000b1 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  b1:	55                   	push   %ebp
  b2:	89 e5                	mov    %esp,%ebp
  b4:	57                   	push   %edi
  b5:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b9:	8b 55 10             	mov    0x10(%ebp),%edx
  bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  bf:	89 cb                	mov    %ecx,%ebx
  c1:	89 df                	mov    %ebx,%edi
  c3:	89 d1                	mov    %edx,%ecx
  c5:	fc                   	cld    
  c6:	f3 aa                	rep stos %al,%es:(%edi)
  c8:	89 ca                	mov    %ecx,%edx
  ca:	89 fb                	mov    %edi,%ebx
  cc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  cf:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  d2:	5b                   	pop    %ebx
  d3:	5f                   	pop    %edi
  d4:	5d                   	pop    %ebp
  d5:	c3                   	ret    

000000d6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  d6:	55                   	push   %ebp
  d7:	89 e5                	mov    %esp,%ebp
  d9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  dc:	8b 45 08             	mov    0x8(%ebp),%eax
  df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  e2:	90                   	nop
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	8d 50 01             	lea    0x1(%eax),%edx
  e9:	89 55 08             	mov    %edx,0x8(%ebp)
  ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  ef:	8d 4a 01             	lea    0x1(%edx),%ecx
  f2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  f5:	0f b6 12             	movzbl (%edx),%edx
  f8:	88 10                	mov    %dl,(%eax)
  fa:	0f b6 00             	movzbl (%eax),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 e2                	jne    e3 <strcpy+0xd>
    ;
  return os;
 101:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 104:	c9                   	leave  
 105:	c3                   	ret    

00000106 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 109:	eb 08                	jmp    113 <strcmp+0xd>
    p++, q++;
 10b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 10f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	74 10                	je     12d <strcmp+0x27>
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	0f b6 10             	movzbl (%eax),%edx
 123:	8b 45 0c             	mov    0xc(%ebp),%eax
 126:	0f b6 00             	movzbl (%eax),%eax
 129:	38 c2                	cmp    %al,%dl
 12b:	74 de                	je     10b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 12d:	8b 45 08             	mov    0x8(%ebp),%eax
 130:	0f b6 00             	movzbl (%eax),%eax
 133:	0f b6 d0             	movzbl %al,%edx
 136:	8b 45 0c             	mov    0xc(%ebp),%eax
 139:	0f b6 00             	movzbl (%eax),%eax
 13c:	0f b6 c0             	movzbl %al,%eax
 13f:	29 c2                	sub    %eax,%edx
 141:	89 d0                	mov    %edx,%eax
}
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    

00000145 <strlen>:

uint
strlen(char *s)
{
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
 148:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 14b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 152:	eb 04                	jmp    158 <strlen+0x13>
 154:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 158:	8b 55 fc             	mov    -0x4(%ebp),%edx
 15b:	8b 45 08             	mov    0x8(%ebp),%eax
 15e:	01 d0                	add    %edx,%eax
 160:	0f b6 00             	movzbl (%eax),%eax
 163:	84 c0                	test   %al,%al
 165:	75 ed                	jne    154 <strlen+0xf>
    ;
  return n;
 167:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 16a:	c9                   	leave  
 16b:	c3                   	ret    

0000016c <memset>:

void*
memset(void *dst, int c, uint n)
{
 16c:	55                   	push   %ebp
 16d:	89 e5                	mov    %esp,%ebp
 16f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 172:	8b 45 10             	mov    0x10(%ebp),%eax
 175:	89 44 24 08          	mov    %eax,0x8(%esp)
 179:	8b 45 0c             	mov    0xc(%ebp),%eax
 17c:	89 44 24 04          	mov    %eax,0x4(%esp)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	89 04 24             	mov    %eax,(%esp)
 186:	e8 26 ff ff ff       	call   b1 <stosb>
  return dst;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	83 ec 04             	sub    $0x4,%esp
 196:	8b 45 0c             	mov    0xc(%ebp),%eax
 199:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 19c:	eb 14                	jmp    1b2 <strchr+0x22>
    if(*s == c)
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	0f b6 00             	movzbl (%eax),%eax
 1a4:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1a7:	75 05                	jne    1ae <strchr+0x1e>
      return (char*)s;
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	eb 13                	jmp    1c1 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1ae:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	0f b6 00             	movzbl (%eax),%eax
 1b8:	84 c0                	test   %al,%al
 1ba:	75 e2                	jne    19e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1bc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1c1:	c9                   	leave  
 1c2:	c3                   	ret    

000001c3 <gets>:

char*
gets(char *buf, int max)
{
 1c3:	55                   	push   %ebp
 1c4:	89 e5                	mov    %esp,%ebp
 1c6:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1d0:	eb 4c                	jmp    21e <gets+0x5b>
    cc = read(0, &c, 1);
 1d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1d9:	00 
 1da:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e8:	e8 44 01 00 00       	call   331 <read>
 1ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1f4:	7f 02                	jg     1f8 <gets+0x35>
      break;
 1f6:	eb 31                	jmp    229 <gets+0x66>
    buf[i++] = c;
 1f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 f4             	mov    %edx,-0xc(%ebp)
 201:	89 c2                	mov    %eax,%edx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	01 c2                	add    %eax,%edx
 208:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 20c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 20e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 212:	3c 0a                	cmp    $0xa,%al
 214:	74 13                	je     229 <gets+0x66>
 216:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 21a:	3c 0d                	cmp    $0xd,%al
 21c:	74 0b                	je     229 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 221:	83 c0 01             	add    $0x1,%eax
 224:	3b 45 0c             	cmp    0xc(%ebp),%eax
 227:	7c a9                	jl     1d2 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 229:	8b 55 f4             	mov    -0xc(%ebp),%edx
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
 22f:	01 d0                	add    %edx,%eax
 231:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 234:	8b 45 08             	mov    0x8(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <stat>:

int
stat(char *n, struct stat *st)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 23f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 246:	00 
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 07 01 00 00       	call   359 <open>
 252:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 255:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 259:	79 07                	jns    262 <stat+0x29>
    return -1;
 25b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 260:	eb 23                	jmp    285 <stat+0x4c>
  r = fstat(fd, st);
 262:	8b 45 0c             	mov    0xc(%ebp),%eax
 265:	89 44 24 04          	mov    %eax,0x4(%esp)
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	89 04 24             	mov    %eax,(%esp)
 26f:	e8 fd 00 00 00       	call   371 <fstat>
 274:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 277:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27a:	89 04 24             	mov    %eax,(%esp)
 27d:	e8 bf 00 00 00       	call   341 <close>
  return r;
 282:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <atoi>:

int
atoi(const char *s)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 28d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 294:	eb 25                	jmp    2bb <atoi+0x34>
    n = n*10 + *s++ - '0';
 296:	8b 55 fc             	mov    -0x4(%ebp),%edx
 299:	89 d0                	mov    %edx,%eax
 29b:	c1 e0 02             	shl    $0x2,%eax
 29e:	01 d0                	add    %edx,%eax
 2a0:	01 c0                	add    %eax,%eax
 2a2:	89 c1                	mov    %eax,%ecx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8d 50 01             	lea    0x1(%eax),%edx
 2aa:	89 55 08             	mov    %edx,0x8(%ebp)
 2ad:	0f b6 00             	movzbl (%eax),%eax
 2b0:	0f be c0             	movsbl %al,%eax
 2b3:	01 c8                	add    %ecx,%eax
 2b5:	83 e8 30             	sub    $0x30,%eax
 2b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	0f b6 00             	movzbl (%eax),%eax
 2c1:	3c 2f                	cmp    $0x2f,%al
 2c3:	7e 0a                	jle    2cf <atoi+0x48>
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
 2c8:	0f b6 00             	movzbl (%eax),%eax
 2cb:	3c 39                	cmp    $0x39,%al
 2cd:	7e c7                	jle    296 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2e6:	eb 17                	jmp    2ff <memmove+0x2b>
    *dst++ = *src++;
 2e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2eb:	8d 50 01             	lea    0x1(%eax),%edx
 2ee:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2f1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2f4:	8d 4a 01             	lea    0x1(%edx),%ecx
 2f7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2fa:	0f b6 12             	movzbl (%edx),%edx
 2fd:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ff:	8b 45 10             	mov    0x10(%ebp),%eax
 302:	8d 50 ff             	lea    -0x1(%eax),%edx
 305:	89 55 10             	mov    %edx,0x10(%ebp)
 308:	85 c0                	test   %eax,%eax
 30a:	7f dc                	jg     2e8 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 311:	b8 01 00 00 00       	mov    $0x1,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <exit>:
SYSCALL(exit)
 319:	b8 02 00 00 00       	mov    $0x2,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <wait>:
SYSCALL(wait)
 321:	b8 03 00 00 00       	mov    $0x3,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <pipe>:
SYSCALL(pipe)
 329:	b8 04 00 00 00       	mov    $0x4,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <read>:
SYSCALL(read)
 331:	b8 05 00 00 00       	mov    $0x5,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <write>:
SYSCALL(write)
 339:	b8 10 00 00 00       	mov    $0x10,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <close>:
SYSCALL(close)
 341:	b8 15 00 00 00       	mov    $0x15,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <kill>:
SYSCALL(kill)
 349:	b8 06 00 00 00       	mov    $0x6,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <exec>:
SYSCALL(exec)
 351:	b8 07 00 00 00       	mov    $0x7,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <open>:
SYSCALL(open)
 359:	b8 0f 00 00 00       	mov    $0xf,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <mknod>:
SYSCALL(mknod)
 361:	b8 11 00 00 00       	mov    $0x11,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <unlink>:
SYSCALL(unlink)
 369:	b8 12 00 00 00       	mov    $0x12,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <fstat>:
SYSCALL(fstat)
 371:	b8 08 00 00 00       	mov    $0x8,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <link>:
SYSCALL(link)
 379:	b8 13 00 00 00       	mov    $0x13,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <mkdir>:
SYSCALL(mkdir)
 381:	b8 14 00 00 00       	mov    $0x14,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <chdir>:
SYSCALL(chdir)
 389:	b8 09 00 00 00       	mov    $0x9,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <dup>:
SYSCALL(dup)
 391:	b8 0a 00 00 00       	mov    $0xa,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <getpid>:
SYSCALL(getpid)
 399:	b8 0b 00 00 00       	mov    $0xb,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <sbrk>:
SYSCALL(sbrk)
 3a1:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <sleep>:
SYSCALL(sleep)
 3a9:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <uptime>:
SYSCALL(uptime)
 3b1:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b9:	55                   	push   %ebp
 3ba:	89 e5                	mov    %esp,%ebp
 3bc:	83 ec 18             	sub    $0x18,%esp
 3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c2:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3c5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cc:	00 
 3cd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	89 04 24             	mov    %eax,(%esp)
 3da:	e8 5a ff ff ff       	call   339 <write>
}
 3df:	c9                   	leave  
 3e0:	c3                   	ret    

000003e1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3e9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3f0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3f4:	74 17                	je     40d <printint+0x2c>
 3f6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3fa:	79 11                	jns    40d <printint+0x2c>
    neg = 1;
 3fc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 403:	8b 45 0c             	mov    0xc(%ebp),%eax
 406:	f7 d8                	neg    %eax
 408:	89 45 ec             	mov    %eax,-0x14(%ebp)
 40b:	eb 06                	jmp    413 <printint+0x32>
  } else {
    x = xx;
 40d:	8b 45 0c             	mov    0xc(%ebp),%eax
 410:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 413:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 41a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 41d:	8d 41 01             	lea    0x1(%ecx),%eax
 420:	89 45 f4             	mov    %eax,-0xc(%ebp)
 423:	8b 5d 10             	mov    0x10(%ebp),%ebx
 426:	8b 45 ec             	mov    -0x14(%ebp),%eax
 429:	ba 00 00 00 00       	mov    $0x0,%edx
 42e:	f7 f3                	div    %ebx
 430:	89 d0                	mov    %edx,%eax
 432:	0f b6 80 c8 0a 00 00 	movzbl 0xac8(%eax),%eax
 439:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 43d:	8b 75 10             	mov    0x10(%ebp),%esi
 440:	8b 45 ec             	mov    -0x14(%ebp),%eax
 443:	ba 00 00 00 00       	mov    $0x0,%edx
 448:	f7 f6                	div    %esi
 44a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 44d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 451:	75 c7                	jne    41a <printint+0x39>
  if(neg)
 453:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 457:	74 10                	je     469 <printint+0x88>
    buf[i++] = '-';
 459:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45c:	8d 50 01             	lea    0x1(%eax),%edx
 45f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 462:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 467:	eb 1f                	jmp    488 <printint+0xa7>
 469:	eb 1d                	jmp    488 <printint+0xa7>
    putc(fd, buf[i]);
 46b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 471:	01 d0                	add    %edx,%eax
 473:	0f b6 00             	movzbl (%eax),%eax
 476:	0f be c0             	movsbl %al,%eax
 479:	89 44 24 04          	mov    %eax,0x4(%esp)
 47d:	8b 45 08             	mov    0x8(%ebp),%eax
 480:	89 04 24             	mov    %eax,(%esp)
 483:	e8 31 ff ff ff       	call   3b9 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 488:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 48c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 490:	79 d9                	jns    46b <printint+0x8a>
    putc(fd, buf[i]);
}
 492:	83 c4 30             	add    $0x30,%esp
 495:	5b                   	pop    %ebx
 496:	5e                   	pop    %esi
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    

00000499 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 49f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4a6:	8d 45 0c             	lea    0xc(%ebp),%eax
 4a9:	83 c0 04             	add    $0x4,%eax
 4ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4b6:	e9 7c 01 00 00       	jmp    637 <printf+0x19e>
    c = fmt[i] & 0xff;
 4bb:	8b 55 0c             	mov    0xc(%ebp),%edx
 4be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c1:	01 d0                	add    %edx,%eax
 4c3:	0f b6 00             	movzbl (%eax),%eax
 4c6:	0f be c0             	movsbl %al,%eax
 4c9:	25 ff 00 00 00       	and    $0xff,%eax
 4ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d5:	75 2c                	jne    503 <printf+0x6a>
      if(c == '%'){
 4d7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4db:	75 0c                	jne    4e9 <printf+0x50>
        state = '%';
 4dd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4e4:	e9 4a 01 00 00       	jmp    633 <printf+0x19a>
      } else {
        putc(fd, c);
 4e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ec:	0f be c0             	movsbl %al,%eax
 4ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	89 04 24             	mov    %eax,(%esp)
 4f9:	e8 bb fe ff ff       	call   3b9 <putc>
 4fe:	e9 30 01 00 00       	jmp    633 <printf+0x19a>
      }
    } else if(state == '%'){
 503:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 507:	0f 85 26 01 00 00    	jne    633 <printf+0x19a>
      if(c == 'd'){
 50d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 511:	75 2d                	jne    540 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 513:	8b 45 e8             	mov    -0x18(%ebp),%eax
 516:	8b 00                	mov    (%eax),%eax
 518:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 51f:	00 
 520:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 527:	00 
 528:	89 44 24 04          	mov    %eax,0x4(%esp)
 52c:	8b 45 08             	mov    0x8(%ebp),%eax
 52f:	89 04 24             	mov    %eax,(%esp)
 532:	e8 aa fe ff ff       	call   3e1 <printint>
        ap++;
 537:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 53b:	e9 ec 00 00 00       	jmp    62c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 540:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 544:	74 06                	je     54c <printf+0xb3>
 546:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 54a:	75 2d                	jne    579 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 54c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54f:	8b 00                	mov    (%eax),%eax
 551:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 558:	00 
 559:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 560:	00 
 561:	89 44 24 04          	mov    %eax,0x4(%esp)
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	89 04 24             	mov    %eax,(%esp)
 56b:	e8 71 fe ff ff       	call   3e1 <printint>
        ap++;
 570:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 574:	e9 b3 00 00 00       	jmp    62c <printf+0x193>
      } else if(c == 's'){
 579:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 57d:	75 45                	jne    5c4 <printf+0x12b>
        s = (char*)*ap;
 57f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 582:	8b 00                	mov    (%eax),%eax
 584:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 587:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 58b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 58f:	75 09                	jne    59a <printf+0x101>
          s = "(null)";
 591:	c7 45 f4 79 08 00 00 	movl   $0x879,-0xc(%ebp)
        while(*s != 0){
 598:	eb 1e                	jmp    5b8 <printf+0x11f>
 59a:	eb 1c                	jmp    5b8 <printf+0x11f>
          putc(fd, *s);
 59c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59f:	0f b6 00             	movzbl (%eax),%eax
 5a2:	0f be c0             	movsbl %al,%eax
 5a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 05 fe ff ff       	call   3b9 <putc>
          s++;
 5b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bb:	0f b6 00             	movzbl (%eax),%eax
 5be:	84 c0                	test   %al,%al
 5c0:	75 da                	jne    59c <printf+0x103>
 5c2:	eb 68                	jmp    62c <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5c8:	75 1d                	jne    5e7 <printf+0x14e>
        putc(fd, *ap);
 5ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cd:	8b 00                	mov    (%eax),%eax
 5cf:	0f be c0             	movsbl %al,%eax
 5d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	89 04 24             	mov    %eax,(%esp)
 5dc:	e8 d8 fd ff ff       	call   3b9 <putc>
        ap++;
 5e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e5:	eb 45                	jmp    62c <printf+0x193>
      } else if(c == '%'){
 5e7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5eb:	75 17                	jne    604 <printf+0x16b>
        putc(fd, c);
 5ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f0:	0f be c0             	movsbl %al,%eax
 5f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	89 04 24             	mov    %eax,(%esp)
 5fd:	e8 b7 fd ff ff       	call   3b9 <putc>
 602:	eb 28                	jmp    62c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 604:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 60b:	00 
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	89 04 24             	mov    %eax,(%esp)
 612:	e8 a2 fd ff ff       	call   3b9 <putc>
        putc(fd, c);
 617:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61a:	0f be c0             	movsbl %al,%eax
 61d:	89 44 24 04          	mov    %eax,0x4(%esp)
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 04 24             	mov    %eax,(%esp)
 627:	e8 8d fd ff ff       	call   3b9 <putc>
      }
      state = 0;
 62c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 633:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 637:	8b 55 0c             	mov    0xc(%ebp),%edx
 63a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 63d:	01 d0                	add    %edx,%eax
 63f:	0f b6 00             	movzbl (%eax),%eax
 642:	84 c0                	test   %al,%al
 644:	0f 85 71 fe ff ff    	jne    4bb <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 64a:	c9                   	leave  
 64b:	c3                   	ret    

0000064c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 64c:	55                   	push   %ebp
 64d:	89 e5                	mov    %esp,%ebp
 64f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 652:	8b 45 08             	mov    0x8(%ebp),%eax
 655:	83 e8 08             	sub    $0x8,%eax
 658:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65b:	a1 e4 0a 00 00       	mov    0xae4,%eax
 660:	89 45 fc             	mov    %eax,-0x4(%ebp)
 663:	eb 24                	jmp    689 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66d:	77 12                	ja     681 <free+0x35>
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 675:	77 24                	ja     69b <free+0x4f>
 677:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67f:	77 1a                	ja     69b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	89 45 fc             	mov    %eax,-0x4(%ebp)
 689:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 68f:	76 d4                	jbe    665 <free+0x19>
 691:	8b 45 fc             	mov    -0x4(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 699:	76 ca                	jbe    665 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	8b 40 04             	mov    0x4(%eax),%eax
 6a1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ab:	01 c2                	add    %eax,%edx
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	39 c2                	cmp    %eax,%edx
 6b4:	75 24                	jne    6da <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b9:	8b 50 04             	mov    0x4(%eax),%edx
 6bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bf:	8b 00                	mov    (%eax),%eax
 6c1:	8b 40 04             	mov    0x4(%eax),%eax
 6c4:	01 c2                	add    %eax,%edx
 6c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cf:	8b 00                	mov    (%eax),%eax
 6d1:	8b 10                	mov    (%eax),%edx
 6d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d6:	89 10                	mov    %edx,(%eax)
 6d8:	eb 0a                	jmp    6e4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dd:	8b 10                	mov    (%eax),%edx
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e7:	8b 40 04             	mov    0x4(%eax),%eax
 6ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	01 d0                	add    %edx,%eax
 6f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f9:	75 20                	jne    71b <free+0xcf>
    p->s.size += bp->s.size;
 6fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fe:	8b 50 04             	mov    0x4(%eax),%edx
 701:	8b 45 f8             	mov    -0x8(%ebp),%eax
 704:	8b 40 04             	mov    0x4(%eax),%eax
 707:	01 c2                	add    %eax,%edx
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 712:	8b 10                	mov    (%eax),%edx
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	89 10                	mov    %edx,(%eax)
 719:	eb 08                	jmp    723 <free+0xd7>
  } else
    p->s.ptr = bp;
 71b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 721:	89 10                	mov    %edx,(%eax)
  freep = p;
 723:	8b 45 fc             	mov    -0x4(%ebp),%eax
 726:	a3 e4 0a 00 00       	mov    %eax,0xae4
}
 72b:	c9                   	leave  
 72c:	c3                   	ret    

0000072d <morecore>:

static Header*
morecore(uint nu)
{
 72d:	55                   	push   %ebp
 72e:	89 e5                	mov    %esp,%ebp
 730:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 733:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 73a:	77 07                	ja     743 <morecore+0x16>
    nu = 4096;
 73c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	c1 e0 03             	shl    $0x3,%eax
 749:	89 04 24             	mov    %eax,(%esp)
 74c:	e8 50 fc ff ff       	call   3a1 <sbrk>
 751:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 754:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 758:	75 07                	jne    761 <morecore+0x34>
    return 0;
 75a:	b8 00 00 00 00       	mov    $0x0,%eax
 75f:	eb 22                	jmp    783 <morecore+0x56>
  hp = (Header*)p;
 761:	8b 45 f4             	mov    -0xc(%ebp),%eax
 764:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 767:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76a:	8b 55 08             	mov    0x8(%ebp),%edx
 76d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 770:	8b 45 f0             	mov    -0x10(%ebp),%eax
 773:	83 c0 08             	add    $0x8,%eax
 776:	89 04 24             	mov    %eax,(%esp)
 779:	e8 ce fe ff ff       	call   64c <free>
  return freep;
 77e:	a1 e4 0a 00 00       	mov    0xae4,%eax
}
 783:	c9                   	leave  
 784:	c3                   	ret    

00000785 <malloc>:

void*
malloc(uint nbytes)
{
 785:	55                   	push   %ebp
 786:	89 e5                	mov    %esp,%ebp
 788:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	83 c0 07             	add    $0x7,%eax
 791:	c1 e8 03             	shr    $0x3,%eax
 794:	83 c0 01             	add    $0x1,%eax
 797:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 79a:	a1 e4 0a 00 00       	mov    0xae4,%eax
 79f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7a6:	75 23                	jne    7cb <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7a8:	c7 45 f0 dc 0a 00 00 	movl   $0xadc,-0x10(%ebp)
 7af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b2:	a3 e4 0a 00 00       	mov    %eax,0xae4
 7b7:	a1 e4 0a 00 00       	mov    0xae4,%eax
 7bc:	a3 dc 0a 00 00       	mov    %eax,0xadc
    base.s.size = 0;
 7c1:	c7 05 e0 0a 00 00 00 	movl   $0x0,0xae0
 7c8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ce:	8b 00                	mov    (%eax),%eax
 7d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7dc:	72 4d                	jb     82b <malloc+0xa6>
      if(p->s.size == nunits)
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	8b 40 04             	mov    0x4(%eax),%eax
 7e4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e7:	75 0c                	jne    7f5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ec:	8b 10                	mov    (%eax),%edx
 7ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f1:	89 10                	mov    %edx,(%eax)
 7f3:	eb 26                	jmp    81b <malloc+0x96>
      else {
        p->s.size -= nunits;
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 40 04             	mov    0x4(%eax),%eax
 7fb:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7fe:	89 c2                	mov    %eax,%edx
 800:	8b 45 f4             	mov    -0xc(%ebp),%eax
 803:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 806:	8b 45 f4             	mov    -0xc(%ebp),%eax
 809:	8b 40 04             	mov    0x4(%eax),%eax
 80c:	c1 e0 03             	shl    $0x3,%eax
 80f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 812:	8b 45 f4             	mov    -0xc(%ebp),%eax
 815:	8b 55 ec             	mov    -0x14(%ebp),%edx
 818:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 81b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81e:	a3 e4 0a 00 00       	mov    %eax,0xae4
      return (void*)(p + 1);
 823:	8b 45 f4             	mov    -0xc(%ebp),%eax
 826:	83 c0 08             	add    $0x8,%eax
 829:	eb 38                	jmp    863 <malloc+0xde>
    }
    if(p == freep)
 82b:	a1 e4 0a 00 00       	mov    0xae4,%eax
 830:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 833:	75 1b                	jne    850 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 835:	8b 45 ec             	mov    -0x14(%ebp),%eax
 838:	89 04 24             	mov    %eax,(%esp)
 83b:	e8 ed fe ff ff       	call   72d <morecore>
 840:	89 45 f4             	mov    %eax,-0xc(%ebp)
 843:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 847:	75 07                	jne    850 <malloc+0xcb>
        return 0;
 849:	b8 00 00 00 00       	mov    $0x0,%eax
 84e:	eb 13                	jmp    863 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 850:	8b 45 f4             	mov    -0xc(%ebp),%eax
 853:	89 45 f0             	mov    %eax,-0x10(%ebp)
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	8b 00                	mov    (%eax),%eax
 85b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 85e:	e9 70 ff ff ff       	jmp    7d3 <malloc+0x4e>
}
 863:	c9                   	leave  
 864:	c3                   	ret    
