//
//  Shader.fsh
//  HelloOpenGlGame
//
//  Created by liudongbao on 12-11-21.
//  Copyright (c) 2012年 liudongbao. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
