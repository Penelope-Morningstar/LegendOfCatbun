from PIL import Image
import math

colors = []
palette = Image.open("ArtConverter/Palette.png")
palette = palette.convert("RGBA")
paletteWidth, paletteHeight = palette.size
for y in range(paletteHeight):
    for x in range(paletteWidth):
        r,g,b,a = palette.getpixel((x,y))
        nr = math.floor((r/255.0)*32)
        if nr == 32:
            nr = 31
        ng = math.floor((g/255.0)*32)
        if ng == 32:
            ng = 31
        nb = math.floor((b/255.0)*32)
        if nb == 32:
            nb = 31
            
        ng = ng << 5
        nb = nb << 10
        half = nr+ng+nb
        colors.append(half)

with open("ArtConverter/Palette.asm", "w") as f:
    n = 0
    line = ".half "
    for c in colors:
        n+=1
        if(n!=1):
            line +=","
        line += hex(c)
        if(n==8):
            f.write(line)
            line = "\n.half "
            n=0
            
tilemap = Image.open("ArtConverter/TestHeart.png")
tilemap = tilemap.convert("RGBA")
tw,th = tilemap.size
tilebytes = []
for ty in range(32):
    for tx in range(16):
        for y in range(8):
            for x in range(8):
                r,g,b,a = tilemap.getpixel((tx*8+x,ty*8+y))
                nr = math.floor((r/255.0)*32)
                if nr == 32:
                    nr = 31
                ng = math.floor((g/255.0)*32)
                if ng == 32:
                    ng = 31
                nb = math.floor((b/255.0)*32)
                if nb == 32:
                    nb = 31
                ng = ng << 5
                nb = nb << 10
                half = nr+ng+nb
                if half in colors:
                    index = colors.index(half)
                    tilebytes.append(index)
                else:
                    tilebytes.append(0)

with open("ArtConverter/Tilemap.asm", "w") as f:
    n = 0
    line = ".byte "
    for c in tilebytes:
        n+=1
        if(n!=1):
            line +=","
        line += hex(c)
        if(n==8):
            f.write(line)
            line = "\n.byte "
            n=0
    
            
            
            
        