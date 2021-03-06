/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.yunnex.ops.erp.common.supcan.freeform;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.yunnex.ops.erp.common.supcan.common.Common;
import com.yunnex.ops.erp.common.supcan.common.properties.Properties;

/**
 * 硕正FreeForm
 * @author WangZhen
 * @version 2013-11-04
 */
@XStreamAlias("FreeForm")
public class FreeForm extends Common {

    public FreeForm() {
        super();
    }
    
    public FreeForm(Properties properties) {
        this();
        this.properties = properties;
    }
    }
