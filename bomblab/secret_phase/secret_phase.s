0x402619:       "%d %d %s"
0x402622:       "DrEvil"
0x6030f0 <n1>:     0x24    
0x6030f8 <n1+8>:   0x603110 <n21>
0x603100 <n1+16>:  0x603130 <n22>  

0x603110 <n21>:    0x8     
0x603118 <n21+8>:  0x603190 <n31>
0x603120 <n21+16>: 0x603150 <n32>  

0x603130 <n22>:    0x32    
0x603138 <n22+8>:  0x603170 <n33>
0x603140 <n22+16>: 0x6031b0 <n34>  

0x603150 <n32>:    0x16    
0x603158 <n32+8>:  0x603270 <n43>
0x603160 <n32+16>: 0x603230 <n44>  

0x603170 <n33>:    0x2d    
0x603178 <n33+8>:  0x6031d0 <n45>
0x603180 <n33+16>: 0x603290 <n46>  

0x603190 <n31>:    0x6     
0x603198 <n31+8>:  0x6031f0 <n41>
0x6031a0 <n31+16>: 0x603250 <n42>  

0x6031b0 <n34>:    0x6b    
0x6031b8 <n34+8>:  0x603210 <n47>
0x6031c0 <n34+16>: 0x6032b0 <n48>  

0x6031d0 <n45>:    0x28    
0x6031d8 <n45+8>:  0x0
0x6031e0 <n45+16>: 0x0     

0x6031f0 <n41>:    0x1     
0x6031f8 <n41+8>:  0x0
0x603200 <n41+16>: 0x0     

0x603210 <n47>:    0x63    
0x603218 <n47+8>:  0x0
0x603220 <n47+16>: 0x0     

0x603230 <n44>:    0x23    
0x603238 <n44+8>:  0x0
0x603240 <n44+16>: 0x0     

0x603250 <n42>:    0x7     
0x603258 <n42+8>:  0x0
0x603260 <n42+16>: 0x0     

0x603270 <n43>:    0x14    
0x603278 <n43+8>:  0x0
0x603280 <n43+16>: 0x0     

0x603290 <n46>:    0x2f    
0x603298 <n46+8>:  0x0
0x6032a0 <n46+16>: 0x0     

0x6032b0 <n48>:    0x3e9   
0x6032b8 <n48+8>:  0x0
0x6032c0 <n48+16>: 0x0     

一眼二叉树（结构如下）
              36
      ________|________
      |               |
      8               50
  ____|____       ____|____
  |       |       |       |
  6       22      45      107
__|__   __|__   __|__   __|__
|   |   |   |   |   |   |   |
1   7   20  35  40  47  99  1001


phase_defused:
   0x00000000004015c4 <+0>:     sub    $0x78,%rsp
   0x00000000004015c8 <+4>:     mov    %fs:0x28,%rax
   0x00000000004015d1 <+13>:    mov    %rax,0x68(%rsp)
   0x00000000004015d6 <+18>:    xor    %eax,%eax
   0x00000000004015d8 <+20>:    cmpl   $0x6,0x202181(%rip)        # 0x603760 <num_input_strings>
   0x00000000004015df <+27>:    jne    0x40163f <phase_defused+123>
   0x00000000004015e1 <+29>:    lea    0x10(%rsp),%r8 #sscnaf的第三个输出参数
   0x00000000004015e6 <+34>:    lea    0xc(%rsp),%rcx #第二个
   0x00000000004015eb <+39>:    lea    0x8(%rsp),%rdx #第一个
   0x00000000004015f0 <+44>:    mov    $0x402619,%esi
   0x00000000004015f5 <+49>:    mov    $0x603870,%edi #从名字判断这里应该是存放了输入字符串，在运行中查看此处内存，确定为phase4的输入字符串
   0x00000000004015fa <+54>:    call   0x400bf0 <__isoc99_sscanf@plt>
   0x00000000004015ff <+59>:    cmp    $0x3,%eax
   0x0000000000401602 <+62>:    jne    0x401635 <phase_defused+113>
   0x0000000000401604 <+64>:    mov    $0x402622,%esi
   0x0000000000401609 <+69>:    lea    0x10(%rsp),%rdi
   0x000000000040160e <+74>:    call   0x401338 <strings_not_equal>
   0x0000000000401613 <+79>:    test   %eax,%eax
   0x0000000000401615 <+81>:    jne    0x401635 <phase_defused+113> #要避免跳转，则结果应该是0，也就是字符串相等
   0x0000000000401617 <+83>:    mov    $0x4024f8,%edi
   0x000000000040161c <+88>:    call   0x400b10 <puts@plt>
   0x0000000000401621 <+93>:    mov    $0x402520,%edi
   0x0000000000401626 <+98>:    call   0x400b10 <puts@plt>
   0x000000000040162b <+103>:   mov    $0x0,%eax
   0x0000000000401630 <+108>:   call   0x401242 <secret_phase> #想要达到秘密函数，要避开所有的跳转，使程序运行至此
   0x0000000000401635 <+113>:   mov    $0x402558,%edi
   0x000000000040163a <+118>:   call   0x400b10 <puts@plt>
   0x000000000040163f <+123>:   mov    0x68(%rsp),%rax
   0x0000000000401644 <+128>:   xor    %fs:0x28,%rax
   0x000000000040164d <+137>:   je     0x401654 <phase_defused+144>
   0x000000000040164f <+139>:   call   0x400b30 <__stack_chk_fail@plt>
   0x0000000000401654 <+144>:   add    $0x78,%rsp
   0x0000000000401658 <+148>:   ret 

secret_phase:
   0x0000000000401242 <+0>:     push   %rbx
   0x0000000000401243 <+1>:     call   0x40149e <read_line> #%rax中存放着返回值
   0x0000000000401248 <+6>:     mov    $0xa,%edx
   0x000000000040124d <+11>:    mov    $0x0,%esi
   0x0000000000401252 <+16>:    mov    %rax,%rdi
   0x0000000000401255 <+19>:    call   0x400bd0 <strtol@plt> #该函数将输入字符串转化为一个长整型数（十进制）
   0x000000000040125a <+24>:    mov    %rax,%rbx #%rbx中保存输入的长整型数n
   0x000000000040125d <+27>:    lea    -0x1(%rax),%eax 
   0x0000000000401260 <+30>:    cmp    $0x3e8,%eax #将n - 1与1000比较
   0x0000000000401265 <+35>:    jbe    0x40126c <secret_phase+42> #如果n - 1 <= 1000。即n <= 1001，则跳转，避免爆炸
   0x0000000000401267 <+37>:    call   0x40143a <explode_bomb> #如果n > 1001，则爆炸
   0x000000000040126c <+42>:    mov    %ebx,%esi #将n放置于%esi，作为func7的参数
   0x000000000040126e <+44>:    mov    $0x6030f0,%edi
   0x0000000000401273 <+49>:    call   0x401204 <fun7>
   0x0000000000401278 <+54>:    cmp    $0x2,%eax #最后要求返回2
   0x000000000040127b <+57>:    je     0x401282 <secret_phase+64>
   0x000000000040127d <+59>:    call   0x40143a <explode_bomb>
   0x0000000000401282 <+64>:    mov    $0x402438,%edi
   0x0000000000401287 <+69>:    call   0x400b10 <puts@plt>
   0x000000000040128c <+74>:    call   0x4015c4 <phase_defused>
   0x0000000000401291 <+79>:    pop    %rbx
   0x0000000000401292 <+80>:    ret   


fun7:
   0x0000000000401204 <+0>:     sub    $0x8,%rsp
   0x0000000000401208 <+4>:     test   %rdi,%rdi #检查n是否为NULL，为NULL则为递归终点
   0x000000000040120b <+7>:     je     0x401238 <fun7+52>

   #可以认为%rdi放置着curr节点
   0x000000000040120d <+9>:     mov    (%rdi),%edx #%edx = curr->val

   0x000000000040120f <+11>:    cmp    %esi,%edx 
   0x0000000000401211 <+13>:    jle    0x401220 <fun7+28> #如果curr->val的值小于等于n，则
   0x0000000000401213 <+15>:    mov    0x8(%rdi),%rdi #当curr->val大于n，则递归地搜索左节点 curr = curr->left
   0x0000000000401217 <+19>:    call   0x401204 <fun7>
   0x000000000040121c <+24>:    add    %eax,%eax
   0x000000000040121e <+26>:    jmp    0x40123d <fun7+57>

   0x0000000000401220 <+28>:    mov    $0x0,%eax
   0x0000000000401225 <+33>:    cmp    %esi,%edx
   0x0000000000401227 <+35>:    je     0x40123d <fun7+57> #如果curr->val 等于n，则结束递归
   0x0000000000401229 <+37>:    mov    0x10(%rdi),%rdi #如果curr->val小于n，则递归地搜索右节点 curr = curr->right
   0x000000000040122d <+41>:    call   0x401204 <fun7>
   0x0000000000401232 <+46>:    lea    0x1(%rax,%rax,1),%eax #%rax = 2 * %rax + 1
   0x0000000000401236 <+50>:    jmp    0x40123d <fun7+57>

   0x0000000000401238 <+52>:    mov    $0xffffffff,%eax
   0x000000000040123d <+57>:    add    $0x8,%rsp
   0x0000000000401241 <+61>:    ret   

              36
      ________|________
      |               |
      8               50
  ____|____       ____|____
  |       |       |       |
  6       22      45      107
__|__   __|__   __|__   __|__
|   |   |   |   |   |   |   |
1   7   20  35  40  47  99  1001
