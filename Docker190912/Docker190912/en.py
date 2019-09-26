#载入必要的模块
import pygame
import base64
flag_path = "/root/flag.txt"
image_path = "/root/image.jpg"
enflag_path = "/home/test/enflag.txt"

f_flag = open(flag_path,'r',encoding="utf-8")
text = f_flag.readlines()[0]
text = text.strip("\n")
#pygame初始化
pygame.init()
# 待转换文字
#设置字体和字号
font = pygame.font.SysFont('Microsoft YaHei', 64)
#渲染图片，设置背景颜色和字体样式,前面的颜色是字体颜色
ftext = font.render(text, True, (255,0,255),(255, 255, 255))
#保存图片
pygame.image.save(ftext, image_path)#图片保存地址

#读图片并进行编码
f_image = open(image_path,'rb')
image_base64 = base64.b64encode(f_image.read())
s = image_base64.decode()
# print('data:image/jpeg;base64,%s'%s)
f_base64 = open(enflag_path,'w',encoding="utf-8")
f_base64.write('data:image/jpeg;base64,'+s)
