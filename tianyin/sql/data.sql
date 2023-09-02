
create table `tianyin_admin`.gen_table
(
    table_id          bigint auto_increment comment '编号'
        primary key,
    table_name        varchar(200) default ''     null comment '表名称',
    table_comment     varchar(500) default ''     null comment '表描述',
    sub_table_name    varchar(64)                 null comment '关联子表的表名',
    sub_table_fk_name varchar(64)                 null comment '子表关联的外键名',
    class_name        varchar(100) default ''     null comment '实体类名称',
    tpl_category      varchar(200) default 'crud' null comment '使用的模板（crud单表操作 tree树表操作）',
    package_name      varchar(100)                null comment '生成包路径',
    module_name       varchar(30)                 null comment '生成模块名',
    business_name     varchar(30)                 null comment '生成业务名',
    function_name     varchar(50)                 null comment '生成功能名',
    function_author   varchar(50)                 null comment '生成功能作者',
    gen_type          char         default '0'    null comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200) default '/'    null comment '生成路径（不填默认项目路径）',
    options           varchar(1000)               null comment '其它生成选项',
    create_by         varchar(64)  default ''     null comment '创建者',
    create_time       datetime                    null comment '创建时间',
    update_by         varchar(64)  default ''     null comment '更新者',
    update_time       datetime                    null comment '更新时间',
    remark            varchar(500)                null comment '备注'
)
    comment '代码生成业务表' charset = utf8;

create table `tianyin_admin`.gen_table_column
(
    column_id      bigint auto_increment comment '编号'
        primary key,
    table_id       varchar(64)               null comment '归属表编号',
    column_name    varchar(200)              null comment '列名称',
    column_comment varchar(500)              null comment '列描述',
    column_type    varchar(100)              null comment '列类型',
    java_type      varchar(500)              null comment 'JAVA类型',
    java_field     varchar(200)              null comment 'JAVA字段名',
    is_pk          char                      null comment '是否主键（1是）',
    is_increment   char                      null comment '是否自增（1是）',
    is_required    char                      null comment '是否必填（1是）',
    is_insert      char                      null comment '是否为插入字段（1是）',
    is_edit        char                      null comment '是否编辑字段（1是）',
    is_list        char                      null comment '是否列表字段（1是）',
    is_query       char                      null comment '是否查询字段（1是）',
    query_type     varchar(200) default 'EQ' null comment '查询方式（等于、不等于、大于、小于、范围）',
    html_type      varchar(200)              null comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type      varchar(200) default ''   null comment '字典类型',
    sort           int                       null comment '排序',
    create_by      varchar(64)  default ''   null comment '创建者',
    create_time    datetime                  null comment '创建时间',
    update_by      varchar(64)  default ''   null comment '更新者',
    update_time    datetime                  null comment '更新时间'
)
    comment '代码生成业务表字段' charset = utf8;

create table `tianyin_admin`.qrtz_calendars
(
    sched_name    varchar(120) not null,
    calendar_name varchar(200) not null,
    calendar      blob         not null,
    primary key (sched_name, calendar_name)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_fired_triggers
(
    sched_name        varchar(120) not null,
    entry_id          varchar(95)  not null,
    trigger_name      varchar(200) not null,
    trigger_group     varchar(200) not null,
    instance_name     varchar(200) not null,
    fired_time        bigint(13)   not null,
    sched_time        bigint(13)   not null,
    priority          int          not null,
    state             varchar(16)  not null,
    job_name          varchar(200) null,
    job_group         varchar(200) null,
    is_nonconcurrent  varchar(1)   null,
    requests_recovery varchar(1)   null,
    primary key (sched_name, entry_id)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_job_details
(
    sched_name        varchar(120) not null,
    job_name          varchar(200) not null,
    job_group         varchar(200) not null,
    description       varchar(250) null,
    job_class_name    varchar(250) not null,
    is_durable        varchar(1)   not null,
    is_nonconcurrent  varchar(1)   not null,
    is_update_data    varchar(1)   not null,
    requests_recovery varchar(1)   not null,
    job_data          blob         null,
    primary key (sched_name, job_name, job_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_locks
(
    sched_name varchar(120) not null,
    lock_name  varchar(40)  not null,
    primary key (sched_name, lock_name)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_paused_trigger_grps
(
    sched_name    varchar(120) not null,
    trigger_group varchar(200) not null,
    primary key (sched_name, trigger_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_scheduler_state
(
    sched_name        varchar(120) not null,
    instance_name     varchar(200) not null,
    last_checkin_time bigint(13)   not null,
    checkin_interval  bigint(13)   not null,
    primary key (sched_name, instance_name)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_triggers
(
    sched_name     varchar(120) not null,
    trigger_name   varchar(200) not null,
    trigger_group  varchar(200) not null,
    job_name       varchar(200) not null,
    job_group      varchar(200) not null,
    description    varchar(250) null,
    next_fire_time bigint(13)   null,
    prev_fire_time bigint(13)   null,
    priority       int          null,
    trigger_state  varchar(16)  not null,
    trigger_type   varchar(8)   not null,
    start_time     bigint(13)   not null,
    end_time       bigint(13)   null,
    calendar_name  varchar(200) null,
    misfire_instr  smallint(2)  null,
    job_data       blob         null,
    primary key (sched_name, trigger_name, trigger_group),
    constraint qrtz_triggers_ibfk_1
        foreign key (sched_name, job_name, job_group) references `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_blob_triggers
(
    sched_name    varchar(120) not null,
    trigger_name  varchar(200) not null,
    trigger_group varchar(200) not null,
    blob_data     blob         null,
    primary key (sched_name, trigger_name, trigger_group),
    constraint qrtz_blob_triggers_ibfk_1
        foreign key (sched_name, trigger_name, trigger_group) references `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_cron_triggers
(
    sched_name      varchar(120) not null,
    trigger_name    varchar(200) not null,
    trigger_group   varchar(200) not null,
    cron_expression varchar(200) not null,
    time_zone_id    varchar(80)  null,
    primary key (sched_name, trigger_name, trigger_group),
    constraint qrtz_cron_triggers_ibfk_1
        foreign key (sched_name, trigger_name, trigger_group) references `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_simple_triggers
(
    sched_name      varchar(120) not null,
    trigger_name    varchar(200) not null,
    trigger_group   varchar(200) not null,
    repeat_count    bigint(7)    not null,
    repeat_interval bigint(12)   not null,
    times_triggered bigint(10)   not null,
    primary key (sched_name, trigger_name, trigger_group),
    constraint qrtz_simple_triggers_ibfk_1
        foreign key (sched_name, trigger_name, trigger_group) references `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group)
)
    charset = utf8;

create table `tianyin_admin`.qrtz_simprop_triggers
(
    sched_name    varchar(120)   not null,
    trigger_name  varchar(200)   not null,
    trigger_group varchar(200)   not null,
    str_prop_1    varchar(512)   null,
    str_prop_2    varchar(512)   null,
    str_prop_3    varchar(512)   null,
    int_prop_1    int            null,
    int_prop_2    int            null,
    long_prop_1   bigint         null,
    long_prop_2   bigint         null,
    dec_prop_1    decimal(13, 4) null,
    dec_prop_2    decimal(13, 4) null,
    bool_prop_1   varchar(1)     null,
    bool_prop_2   varchar(1)     null,
    primary key (sched_name, trigger_name, trigger_group),
    constraint qrtz_simprop_triggers_ibfk_1
        foreign key (sched_name, trigger_name, trigger_group) references `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group)
)
    charset = utf8;

create index sched_name
    on `tianyin_admin`.qrtz_triggers (sched_name, job_name, job_group);

create table `tianyin_admin`.sys_config
(
    config_id    int(5) auto_increment comment '参数主键'
        primary key,
    config_name  varchar(100) default ''  null comment '参数名称',
    config_key   varchar(100) default ''  null comment '参数键名',
    config_value varchar(500) default ''  null comment '参数键值',
    config_type  char         default 'N' null comment '系统内置（Y是 N否）',
    create_by    varchar(64)  default ''  null comment '创建者',
    create_time  datetime                 null comment '创建时间',
    update_by    varchar(64)  default ''  null comment '更新者',
    update_time  datetime                 null comment '更新时间',
    remark       varchar(500)             null comment '备注'
)
    comment '参数配置表' charset = utf8;

create table `tianyin_admin`.sys_dept
(
    dept_id     bigint auto_increment comment '部门id'
        primary key,
    parent_id   bigint      default 0   null comment '父部门id',
    ancestors   varchar(50) default ''  null comment '祖级列表',
    dept_name   varchar(30) default ''  null comment '部门名称',
    order_num   int(4)      default 0   null comment '显示顺序',
    leader      varchar(20)             null comment '负责人',
    phone       varchar(11)             null comment '联系电话',
    email       varchar(50)             null comment '邮箱',
    status      char        default '0' null comment '部门状态（0正常 1停用）',
    del_flag    char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by   varchar(64) default ''  null comment '创建者',
    create_time datetime                null comment '创建时间',
    update_by   varchar(64) default ''  null comment '更新者',
    update_time datetime                null comment '更新时间'
)
    comment '部门表' charset = utf8;

create table `tianyin_admin`.sys_dict_data
(
    dict_code   bigint auto_increment comment '字典编码'
        primary key,
    dict_sort   int(4)       default 0   null comment '字典排序',
    dict_label  varchar(100) default ''  null comment '字典标签',
    dict_value  varchar(100) default ''  null comment '字典键值',
    dict_type   varchar(100) default ''  null comment '字典类型',
    css_class   varchar(100)             null comment '样式属性（其他样式扩展）',
    list_class  varchar(100)             null comment '表格回显样式',
    is_default  char         default 'N' null comment '是否默认（Y是 N否）',
    pic_path    varchar(255) default ''  null comment 'logo',
    status      char         default '0' null comment '状态（0正常 1停用）',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500)             null comment '备注'
)
    comment '字典数据表' charset = utf8;

create table `tianyin_admin`.sys_dict_type
(
    dict_id     bigint auto_increment comment '字典主键'
        primary key,
    dict_name   varchar(100) default ''  null comment '字典名称',
    dict_type   varchar(100) default ''  null comment '字典类型',
    status      char         default '0' null comment '状态（0正常 1停用）',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500)             null comment '备注',
    constraint dict_type
        unique (dict_type)
)
    comment '字典类型表' charset = utf8;

create table `tianyin_admin`.sys_job
(
    job_id          bigint auto_increment comment '任务ID',
    job_name        varchar(64)  default ''        not null comment '任务名称',
    job_group       varchar(64)  default 'DEFAULT' not null comment '任务组名',
    invoke_target   varchar(500)                   not null comment '调用目标字符串',
    cron_expression varchar(255) default ''        null comment 'cron执行表达式',
    misfire_policy  varchar(20)  default '3'       null comment '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    concurrent      char         default '1'       null comment '是否并发执行（0允许 1禁止）',
    status          char         default '0'       null comment '状态（0正常 1暂停）',
    create_by       varchar(64)  default ''        null comment '创建者',
    create_time     datetime                       null comment '创建时间',
    update_by       varchar(64)  default ''        null comment '更新者',
    update_time     datetime                       null comment '更新时间',
    remark          varchar(500) default ''        null comment '备注信息',
    primary key (job_id, job_name, job_group)
)
    comment '定时任务调度表' charset = utf8;

create table `tianyin_admin`.sys_job_log
(
    job_log_id     bigint auto_increment comment '任务日志ID'
        primary key,
    job_name       varchar(64)               not null comment '任务名称',
    job_group      varchar(64)               not null comment '任务组名',
    invoke_target  varchar(500)              not null comment '调用目标字符串',
    job_message    varchar(500)              null comment '日志信息',
    status         char          default '0' null comment '执行状态（0正常 1失败）',
    exception_info varchar(2000) default ''  null comment '异常信息',
    create_time    datetime                  null comment '创建时间'
)
    comment '定时任务调度日志表' charset = utf8;

create table `tianyin_admin`.sys_logininfor
(
    info_id        bigint auto_increment comment '访问ID'
        primary key,
    user_name      varchar(50)  default ''  null comment '用户账号',
    ipaddr         varchar(128) default ''  null comment '登录IP地址',
    login_location varchar(255) default ''  null comment '登录地点',
    browser        varchar(50)  default ''  null comment '浏览器类型',
    os             varchar(50)  default ''  null comment '操作系统',
    status         char         default '0' null comment '登录状态（0成功 1失败）',
    msg            varchar(255) default ''  null comment '提示消息',
    login_time     datetime                 null comment '访问时间'
)
    comment '系统访问记录' charset = utf8;

create table `tianyin_admin`.sys_menu
(
    menu_id     bigint auto_increment comment '菜单ID'
        primary key,
    menu_name   varchar(50)              not null comment '菜单名称',
    parent_id   bigint       default 0   null comment '父菜单ID',
    order_num   int(4)       default 0   null comment '显示顺序',
    path        varchar(200) default ''  null comment '路由地址',
    component   varchar(255)             null comment '组件路径',
    is_frame    int(1)       default 1   null comment '是否为外链（0是 1否）',
    is_cache    int(1)       default 0   null comment '是否缓存（0缓存 1不缓存）',
    menu_type   char         default ''  null comment '菜单类型（M目录 C菜单 F按钮）',
    visible     char         default '0' null comment '菜单状态（0显示 1隐藏）',
    status      char         default '0' null comment '菜单状态（0正常 1停用）',
    perms       varchar(100)             null comment '权限标识',
    icon        varchar(100) default '#' null comment '菜单图标',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500) default ''  null comment '备注'
)
    comment '菜单权限表' charset = utf8;

create table `tianyin_admin`.sys_notice
(
    notice_id      int(4) auto_increment comment '公告ID'
        primary key,
    notice_title   varchar(50)             not null comment '公告标题',
    notice_type    char                    not null comment '公告类型（1通知 2公告）',
    notice_content longblob                null comment '公告内容',
    status         char        default '0' null comment '公告状态（0正常 1关闭）',
    create_by      varchar(64) default ''  null comment '创建者',
    create_time    datetime                null comment '创建时间',
    update_by      varchar(64) default ''  null comment '更新者',
    update_time    datetime                null comment '更新时间',
    remark         mediumtext              null comment '备注'
)
    comment '通知公告表' charset = utf8;

create table `tianyin_admin`.sys_oper_log
(
    oper_id        bigint auto_increment comment '日志主键'
        primary key,
    title          varchar(50)   default '' null comment '模块标题',
    business_type  int(2)        default 0  null comment '业务类型（0其它 1新增 2修改 3删除）',
    method         varchar(100)  default '' null comment '方法名称',
    request_method varchar(10)   default '' null comment '请求方式',
    operator_type  int(1)        default 0  null comment '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name      varchar(50)   default '' null comment '操作人员',
    dept_name      varchar(50)   default '' null comment '部门名称',
    oper_url       varchar(255)  default '' null comment '请求URL',
    oper_ip        varchar(128)  default '' null comment '主机地址',
    oper_location  varchar(255)  default '' null comment '操作地点',
    oper_param     varchar(2000) default '' null comment '请求参数',
    json_result    varchar(2000) default '' null comment '返回参数',
    status         int(1)        default 0  null comment '操作状态（0正常 1异常）',
    error_msg      varchar(2000) default '' null comment '错误消息',
    oper_time      datetime                 null comment '操作时间'
)
    comment '操作日志记录' charset = utf8;

create table `tianyin_admin`.sys_post
(
    post_id     bigint auto_increment comment '岗位ID'
        primary key,
    post_code   varchar(64)            not null comment '岗位编码',
    post_name   varchar(50)            not null comment '岗位名称',
    post_sort   int(4)                 not null comment '显示顺序',
    status      char                   not null comment '状态（0正常 1停用）',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    remark      varchar(500)           null comment '备注'
)
    comment '岗位信息表' charset = utf8;

create table `tianyin_admin`.sys_role
(
    role_id             bigint auto_increment comment '角色ID'
        primary key,
    role_name           varchar(30)             not null comment '角色名称',
    role_key            varchar(100)            not null comment '角色权限字符串',
    role_sort           int(4)                  not null comment '显示顺序',
    data_scope          char        default '1' null comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    menu_check_strictly tinyint(1)  default 1   null comment '菜单树选择项是否关联显示',
    dept_check_strictly tinyint(1)  default 1   null comment '部门树选择项是否关联显示',
    status              char                    not null comment '角色状态（0正常 1停用）',
    del_flag            char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by           varchar(64) default ''  null comment '创建者',
    create_time         datetime                null comment '创建时间',
    update_by           varchar(64) default ''  null comment '更新者',
    update_time         datetime                null comment '更新时间',
    remark              varchar(500)            null comment '备注'
)
    comment '角色信息表' charset = utf8;

create table `tianyin_admin`.sys_role_dept
(
    role_id bigint not null comment '角色ID',
    dept_id bigint not null comment '部门ID',
    primary key (role_id, dept_id)
)
    comment '角色和部门关联表' charset = utf8;

create table `tianyin_admin`.sys_role_menu
(
    role_id bigint not null comment '角色ID',
    menu_id bigint not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '角色和菜单关联表' charset = utf8;

create table `tianyin_admin`.sys_user
(
    user_id     bigint auto_increment comment '用户ID'
        primary key,
    dept_id     bigint                    null comment '部门ID',
    user_name   varchar(30)               not null comment '用户账号',
    nick_name   varchar(30)               not null comment '用户昵称',
    user_type   varchar(2)   default '00' null comment '用户类型（00系统用户）',
    email       varchar(50)  default ''   null comment '用户邮箱',
    phonenumber varchar(11)  default ''   null comment '手机号码',
    sex         char         default '0'  null comment '用户性别（0男 1女 2未知）',
    avatar      varchar(100) default ''   null comment '头像地址',
    password    varchar(100) default ''   null comment '密码',
    app_id      varchar(64)  default ''   null comment 'APPID',
    private_key varchar(150) default ''   null comment '秘钥',
    status      char         default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag    char         default '0'  null comment '删除标志（0代表存在 2代表删除）',
    login_ip    varchar(128) default ''   null comment '最后登录IP',
    login_date  datetime                  null comment '最后登录时间',
    create_by   varchar(64)  default ''   null comment '创建者',
    create_time datetime                  null comment '创建时间',
    update_by   varchar(64)  default ''   null comment '更新者',
    update_time datetime                  null comment '更新时间',
    remark      varchar(500)              null comment '备注'
)
    comment '用户信息表' charset = utf8;

create table `tianyin_admin`.sys_user_post
(
    user_id bigint not null comment '用户ID',
    post_id bigint not null comment '岗位ID',
    primary key (user_id, post_id)
)
    comment '用户与岗位关联表' charset = utf8;

create table `tianyin_admin`.sys_user_role
(
    user_id bigint not null comment '用户ID',
    role_id bigint not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '用户和角色关联表' charset = utf8;

create table `tianyin_admin`.tianyin_agent
(
    agent_id         varchar(64)                 not null comment '代理ID'
        primary key,
    login_name       varchar(32)    default ''   null comment '登录账号',
    nick_name        varchar(32)    default ''   null comment '昵称',
    phone_number     varchar(11)    default ''   null comment '手机号',
    email            varchar(64)    default ''   null comment '邮箱',
    sex              char           default '0'  null comment '用户性别（0男 1女 2未知）',
    avatar           varchar(100)   default ''   null comment '头像地址',
    password         varchar(100)   default ''   null comment '密码',
    machine_num      mediumint      default 0    null comment '机位数量',
    amount           decimal(10, 2) default 0.00 null comment '账户余额',
    froze_amount     decimal(10, 2) default 0.00 null comment '冻结金额',
    new_old          char           default '1'  null comment '是否新代理（1新代理；2老代理）',
    alipay_name      varchar(100)   default ''   null comment '支付宝账号',
    alipay_account   varchar(100)   default ''   null comment '支付宝账号',
    app_id           varchar(64)    default ''   null comment 'APPID',
    private_key      varchar(150)   default ''   null comment '秘钥',
    notify_url       varchar(255)   default ''   null comment '通知地址',
    order_attribute  varchar(100)   default '0'  null comment '订单属性',
    status           char           default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag         char           default '0'  null comment '删除标志（0代表存在 2代表删除）',
    login_ip         varchar(128)   default ''   null comment '最后登录IP',
    login_date       datetime                    null comment '最后登录时间',
    create_by_id     bigint                      not null comment '管理账号ID',
    create_by_acount varchar(64)    default ''   null comment '创建人',
    create_time      datetime                    null comment '创建时间',
    update_by        varchar(64)    default ''   null comment '更新者',
    update_time      datetime                    null comment '更新时间',
    remark           varchar(500)                null comment '备注'
)
    comment '代理信息表';

create table `tianyin_admin`.tianyin_agent_history
(
    id               bigint auto_increment comment 'ID'
        primary key,
    agent_id         varchar(64)                 not null comment '代理ID',
    order_id         varchar(64)    default ''   null comment '订单ID',
    amount           decimal(10, 2) default 0.00 null comment '变动前余额',
    balance          decimal(10, 2) default 0.00 null comment '变动金额',
    amount_after     decimal(10, 2) default 0.00 null comment '变动后余额',
    change_direction char           default '1'  null comment '资金变动方向（1：加款，2：减款）',
    biz_type         char           default '1'  null comment '业务类型（1：利润，2：提现，3：调账）',
    create_by        varchar(64)    default ''   null comment '创建者',
    create_time      datetime                    null comment '创建时间',
    update_by        varchar(64)    default ''   null comment '更新者',
    update_time      datetime                    null comment '更新时间',
    remark           varchar(255)                null comment '备注'
)
    comment '代理流水记录';

create index agent_id
    on `tianyin_admin`.tianyin_agent_history (agent_id);

create index create_time
    on `tianyin_admin`.tianyin_agent_history (create_time);

create index order_id
    on `tianyin_admin`.tianyin_agent_history (order_id);

create table `tianyin_admin`.tianyin_agent_trade
(
    id           bigint auto_increment
        primary key,
    agent_id     varchar(64)    default ''   null comment '会员ID',
    trade_amount decimal(10, 2) default 0.00 null comment '充值金额',
    trade_fee    decimal(10, 2) default 0.00 null comment '手续费',
    remit_amount decimal(10, 2) default 0.00 null comment '上分金额',
    account_type char           default '1'  null comment '账户类型:1微信，2支付宝，3银行卡',
    trade_status char           default '1'  null comment '状态:1等待审核，2已审核，3驳回',
    create_by    varchar(64)    default ''   null comment '创建人',
    create_time  datetime                    null comment '创建时间',
    update_by    varchar(64)    default ''   null comment '更新人',
    update_time  datetime                    null comment '更新时间',
    remark       varchar(255)                null,
    audit_time   datetime                    null comment '审核时间'
)
    comment '代理充值表';

create index agent_id
    on `tianyin_admin`.tianyin_agent_trade (agent_id);

create index create_time
    on `tianyin_admin`.tianyin_agent_trade (create_time);

create table `tianyin_admin`.tianyin_alipay_config
(
    id                 bigint auto_increment comment 'ID'
        primary key,
    app_id             varchar(100)  default '' not null comment 'APP_ID',
    member_private_key varchar(2000) default '' null comment '商户私钥',
    alipay_public_key  varchar(1000) default '' null comment '支付宝公钥',
    notify_url         varchar(255)  default '' null comment '回调地址'
)
    comment '支付宝当面付配置' row_format = DYNAMIC;

create table `tianyin_admin`.tianyin_focus_notice
(
    notice_id      bigint auto_increment comment 'ID'
        primary key,
    notice_title   varchar(50)              not null comment '标题',
    pic_path       varchar(100) default ''  null comment '图片路径',
    notice_content longblob                 null comment '内容',
    status         char         default '0' null comment '状态（0正常 1关闭）',
    create_by      varchar(64)  default ''  null comment '创建者',
    create_time    datetime                 null comment '创建时间',
    update_by      varchar(64)  default ''  null comment '更新者',
    update_time    datetime                 null comment '更新时间',
    remark         varchar(255)             null comment '备注'
)
    comment '焦点图管理表';

create table `tianyin_admin`.tianyin_goods
(
    goods_id            varchar(64)                 not null comment '商品ID'
        primary key,
    pic_path            varchar(255)   default ''   null comment '主图',
    is_upload_pic       char           default '1'  null comment '是否需要上传凭证（1需要；0不需要）',
    good_title          varchar(100)   default ''   null comment '商品标题',
    good_subtitle       varchar(500)   default ''   null comment '副标题',
    goods_brief         varchar(255)   default ''   null comment '商品简介',
    goods_desc          longblob                    null comment '商品详情',
    goods_number        int            default 0    null comment '商品数量',
    goods_price         decimal(10, 2) default 0.00 null comment '商品价格',
    goods_price_default decimal(10, 2) default 0.00 null comment '默认下单价格',
    goods_unit          varchar(45)    default ''   null comment '商品单位',
    sell_volume         int            default 0    null comment '销量',
    platform            char(10)       default '1'  null comment '品牌（1抖音，2快手，3头条，4火山，5西瓜）',
    min_purchase_num    int            default 0    null comment '单次最低下单量',
    purchase_num        int            default 0    null comment '单次限购数量',
    goods_lock          char           default '1'  null comment '是否需要锁定（1否，2锁定）',
    is_need_hours       char           default 'N'  null comment '是否需要拍时长（Y是 N否）',
    is_highlight        char           default 'N'  null comment '是否凸显（Y是 N否）',
    need_shenhe         char           default '1'  null comment '是否需要审核（0否；1需要）',
    third_platform      char           default '0'  null comment '平台（0自营；1乔治）',
    third_goods_sn      varchar(255)   default ''   null comment '三方平台商品编码',
    douyin_num_type     char           default ''   null comment '获取抖音数量类型（1点赞数；2评论数；3分享数；4粉丝数）',
    order_attribute     char(100)      default '0'  null comment '订单属性',
    status              char           default '0'  null comment '状态（0正常 1停用）',
    del_flag            char           default '0'  null comment '删除标志（0代表存在 2代表删除）',
    create_by           varchar(64)    default ''   null comment '创建者',
    create_time         datetime                    null comment '创建时间',
    update_by           varchar(255)   default ''   null comment '更新者',
    update_time         datetime                    null comment '更新时间'
)
    comment '商品表';

create table `tianyin_admin`.tianyin_goods_member
(
    id          bigint auto_increment
        primary key,
    member_id   varchar(64)    default ''   null comment '会员ID',
    goods_id    varchar(64)    default ''   null comment '商品ID',
    goods_price decimal(10, 2) default 0.00 null comment '单价'
)
    comment '会员商品表';

create index goods_id
    on `tianyin_admin`.tianyin_goods_member (goods_id);

create index member_id
    on `tianyin_admin`.tianyin_goods_member (member_id);

create table `tianyin_admin`.tianyin_http_proxy
(
    id         bigint auto_increment comment 'ID'
        primary key,
    proxy_ip   varchar(64) default ''  null comment '代理地址',
    proxy_port varchar(64) default ''  null comment '端口',
    status     char        default '1' null comment '开启(0正常 1停用)'
)
    comment 'http代理设置' row_format = DYNAMIC;

create table `tianyin_admin`.tianyin_introduce
(
    id      bigint auto_increment
        primary key,
    title   varchar(255) default '' null comment 'title',
    content longblob                null comment '详情'
)
    comment '业务介绍';

create table `tianyin_admin`.tianyin_member
(
    member_id       varchar(64)                 not null comment '会员ID'
        primary key,
    login_name      varchar(30)    default ''   null comment '登录账号',
    recom_number    bigint         default 0    null comment '推荐号码',
    password        varchar(100)   default ''   null comment '密码',
    nick_name       varchar(30)    default ''   null comment '昵称',
    phone_number    varchar(11)    default ''   null comment '手机号',
    sex             char           default '2'  null comment '性别（0男 1女 2未知）',
    avatar          varchar(255)   default ''   null comment '头像地址',
    wx_open_id      varchar(40)    default ''   null comment '微信openId',
    wx_union_id     varchar(40)    default ''   null comment '微信UnionID',
    wx_account      varchar(40)    default ''   null comment '微信号',
    email           varchar(40)    default ''   null comment '邮箱',
    country         varchar(40)    default ''   null comment '国家',
    province        varchar(40)    default ''   null comment '省份',
    city            varchar(40)    default ''   null comment '城市',
    amount          decimal(10, 2) default 0.00 null comment '账户余额',
    first_member_id varchar(64)    default ''   null comment '一级会员',
    private_key     varchar(128)   default ''   null comment '秘钥',
    is_free         char           default '1'  null comment '是否收费（0免费；1收费）',
    status          char           default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag        char           default '0'  null comment '删除标志（0代表存在 2代表删除）',
    create_time     datetime                    null comment '注册时间',
    update_by       varchar(64)    default ''   null comment '更新人',
    update_time     datetime                    null comment '更新时间',
    remark          varchar(255)                null comment '备注'
)
    comment '会员信息表';

create table `tianyin_admin`.tianyin_member_history
(
    id               bigint auto_increment
        primary key,
    member_id        varchar(64)    default ''   null comment '会员ID',
    order_id         varchar(64)    default ''   null comment '业务单号',
    amount           decimal(10, 2) default 0.00 null comment '变动前余额',
    balance          decimal(10, 2) default 0.00 null comment '变动金额',
    amount_after     decimal(10, 2) default 0.00 null comment '变动后余额',
    change_direction char           default '1'  null comment '资金变动方向（1：加款，2：减款）',
    member_biz_type  char           default '1'  null comment '业务类型（1：充值，2：下单，3：调账）',
    create_by        varchar(64)    default ''   null comment '创建者',
    create_time      datetime                    null comment '创建时间',
    update_by        varchar(64)    default ''   null comment '更新者',
    update_time      datetime                    null comment '更新时间',
    remark           varchar(255)                null comment '备注'
)
    comment '会员流水';

create index create_time
    on `tianyin_admin`.tianyin_member_history (create_time);

create index member_id
    on `tianyin_admin`.tianyin_member_history (member_id);

create table `tianyin_admin`.tianyin_member_notice
(
    notice_id      int(4) auto_increment comment '公告ID'
        primary key,
    notice_title   varchar(50)             not null comment '公告标题',
    notice_type    char                    not null comment '公告类型（1通知 2公告）',
    notice_content longblob                null comment '公告内容',
    status         char        default '0' null comment '公告状态（0正常 1关闭）',
    create_by      varchar(64) default ''  null comment '创建者',
    create_time    datetime                null comment '创建时间',
    update_by      varchar(64) default ''  null comment '更新者',
    update_time    datetime                null comment '更新时间',
    remark         longtext                null comment '备注'
)
    comment '会员通知表';

create table `tianyin_admin`.tianyin_member_trade
(
    id           bigint auto_increment
        primary key,
    member_id    varchar(64)    default ''   null comment '会员ID',
    trade_amount decimal(10, 2) default 0.00 null comment '充值金额',
    trade_fee    decimal(10, 2) default 0.00 null comment '手续费',
    remit_amount decimal(10, 2) default 0.00 null comment '上分金额',
    account_type char           default '1'  null comment '账户类型:1微信，2支付宝，3银行卡',
    trade_status char           default '1'  null comment '状态:1等待审核，2已审核，3驳回',
    create_by    varchar(64)    default ''   null comment '创建人',
    create_time  datetime                    null comment '创建时间',
    update_by    varchar(64)    default ''   null comment '更新人',
    update_time  datetime                    null comment '更新时间'
)
    comment '会员充值表';

create table `tianyin_admin`.tianyin_orders
(
    order_id             varchar(64)                 not null comment '订单ID'
        primary key,
    member_id            varchar(64)                 not null comment '会员ID',
    goods_id             varchar(64)                 not null comment '商品ID',
    goods_platform       char           default '0'  null comment '0自营；1乔治',
    goods_price_add      decimal(10, 2) default 0.00 null comment '下单单价',
    goods_price          decimal(10, 2) default 0.00 null comment '抢单价格',
    goods_unit           varchar(45)    default ''   null comment '商品单位',
    hours_num            int            default 0    null comment '小时数',
    machine_num          int            default 0    null comment '机位数量',
    machine_assigned_num int            default 0    null comment '已分配机位数',
    order_amount_add     decimal(10, 2) default 0.00 null comment '下单金额',
    order_amount         decimal(10, 2) default 0.00 null comment '订单金额',
    page_url             varchar(500)   default ''   null comment '主页链接',
    order_lock           char           default '1'  null comment '是否需要锁定（1否，2锁定）',
    is_yuyue             char           default '1'  null comment '是否预约（1普通单；2预约）',
    is_making            char           default '0'  null comment '是否做单中（1是做单中；0否）',
    third_order_id       varchar(64)    default ''   null comment '三方单号',
    third_platform       char(64)       default '1'  null comment '三方平台（1：乔治；2北斗星）',
    third_nick_name      varchar(255)   default ''   null comment '三方昵称',
    machine_num_back     int            default 0    null comment '退机位数',
    reason_back          varchar(255)   default ''   null comment '退款原因',
    order_status         char           default '0'  null comment '订单状态（0待处理，1审核通过，2已分配，3已完成，4退回，5异常，9拒绝）',
    create_time          datetime                    null comment '创建时间',
    audit_time           datetime                    null comment '审核时间',
    assigned_time        datetime                    null comment '分配时间',
    complete_time        datetime                    null comment '完成时间',
    remark               mediumtext                  null comment '备注',
    third_notify_url     varchar(255)   default ''   null comment '三方回调地址',
    mid                  varchar(255)   default ''   null comment '作品ID',
    m_type               varchar(100)   default ''   null comment '作品类型',
    douyin_initial_num   bigint         default 0    null comment '抖音初始数量',
    douyin_current_num   bigint         default 0    null comment '抖音当前数量'
)
    comment '订单信息表';

create index create_time
    on `tianyin_admin`.tianyin_orders (create_time);

create index goods_id
    on `tianyin_admin`.tianyin_orders (goods_id);

create index member_id
    on `tianyin_admin`.tianyin_orders (member_id);

create index order_status
    on `tianyin_admin`.tianyin_orders (order_status);

create table `tianyin_admin`.tianyin_orders_agent
(
    id                 bigint auto_increment comment 'ID'
        primary key,
    order_id           varchar(64)                 not null comment '订单ID',
    agent_id           varchar(64)                 not null comment '代理ID',
    goods_id           varchar(255)   default ''   null comment '商品ID',
    goods_price        decimal(10, 2) default 0.00 null comment '商品价格',
    hours_num          int            default 0    null comment '小时数',
    machine_num        int            default 0    null comment '机位数量',
    order_amount       decimal(10, 2) default 0.00 null comment '子订单金额',
    page_url           varchar(500)   default ''   null comment '主页链接',
    third_order_id     varchar(64)    default ''   null comment '三方单号',
    pic_path1          varchar(255)   default ''   null comment '任务凭证1',
    pic_path2          varchar(255)   default ''   null comment '任务凭证2',
    is_yuyue           char           default '1'  null comment '是否预约（1普通单；2预约）',
    is_zhiding         char           default '0'  null comment '是否后台分配订单（0否；1是）',
    order_status       char           default '2'  null comment '子订单状态（2已接单，3已完成，4审核通过，5审核(部分退单)，6退单，7异常申请，8异常已处理）',
    hours_num_back     int            default 0    null comment '退小时数',
    machine_num_back   int            default 0    null comment '退机位数',
    order_amount_back  decimal(10, 2) default 0.00 null comment '退款',
    reason_back        varchar(255)                null comment '退单、异常原因',
    create_by          varchar(64)    default ''   null comment '创建者',
    create_time        datetime                    null comment '创建时间',
    update_by          varchar(64)    default ''   null comment '更新者',
    update_time        datetime                    null comment '更新时间',
    remark             mediumtext                  null comment '备注',
    third_nick_name    varchar(255)   default ''   null comment '三方昵称',
    douyin_initial_num bigint         default 0    null comment '抖音初始数量',
    douyin_current_num bigint         default 0    null comment '抖音当前数量'
)
    comment '订单分配表';

create index agent_id
    on `tianyin_admin`.tianyin_orders_agent (agent_id);

create index create_time
    on `tianyin_admin`.tianyin_orders_agent (create_time);

create index goods_id
    on `tianyin_admin`.tianyin_orders_agent (goods_id(191));

create index order_id
    on `tianyin_admin`.tianyin_orders_agent (order_id);

create index order_status
    on `tianyin_admin`.tianyin_orders_agent (order_status);

create table `tianyin_admin`.tianyin_orders_copy1
(
    order_id             varchar(64)                 not null comment '订单ID'
        primary key,
    member_id            varchar(64)                 not null comment '会员ID',
    goods_id             varchar(64)                 not null comment '商品ID',
    goods_platform       char           default '0'  null comment '0自营；1乔治',
    goods_price_add      decimal(10, 2) default 0.00 null comment '下单单价',
    goods_price          decimal(10, 2) default 0.00 null comment '抢单价格',
    goods_unit           varchar(45)    default ''   null comment '商品单位',
    hours_num            int            default 0    null comment '小时数',
    machine_num          int            default 0    null comment '机位数量',
    machine_assigned_num int            default 0    null comment '已分配机位数',
    order_amount_add     decimal(10, 2) default 0.00 null comment '下单金额',
    order_amount         decimal(10, 2) default 0.00 null comment '订单金额',
    page_url             varchar(255)   default ''   null comment '主页链接',
    order_lock           char           default '1'  null comment '是否需要锁定（1否，2锁定）',
    is_yuyue             char           default '1'  null comment '是否预约（1普通单；2预约）',
    is_making            char           default '0'  null comment '是否做单中（1是做单中；0否）',
    third_order_id       varchar(64)    default ''   null comment '三方单号',
    third_platform       char           default '1'  null comment '三方平台（1：乔治；2北斗星）',
    third_nick_name      varchar(255)   default ''   null comment '三方昵称',
    machine_num_back     int            default 0    null comment '退机位数',
    reason_back          varchar(255)   default ''   null comment '退款原因',
    order_status         char           default '0'  null comment '订单状态（0待处理，1审核通过，2已分配，3已完成，4退回，5异常，9拒绝）',
    create_time          datetime                    null comment '创建时间',
    audit_time           datetime                    null comment '审核时间',
    assigned_time        datetime                    null comment '分配时间',
    complete_time        datetime                    null comment '完成时间',
    remark               mediumtext                  null comment '备注',
    third_notify_url     varchar(255)   default ''   null comment '三方回调地址'
)
    comment '订单信息表';

create index order_id
    on `tianyin_admin`.tianyin_orders_copy1 (order_id, member_id, goods_id);

create table `tianyin_admin`.tianyin_second_class
(
    id          bigint auto_increment comment 'ID'
        primary key,
    first_class varchar(100) default ''  not null comment '一级分类ID',
    class_title varchar(255) default ''  null comment '名称',
    status      char         default '0' null comment '状态（0正常 1停用）'
)
    comment '二级分类管理';

create table `tianyin_admin`.tianyin_servicer
(
    id               bigint auto_increment
        primary key,
    servicer_account varchar(64)  default '' null comment '客服账号',
    wx_code          varchar(255) default '' null comment '微信收款码',
    alipay_code      varchar(255) default '' null comment '支付宝收款码'
)
    comment '客服-收款码';

create table `tianyin_admin`.tianyin_sett_record
(
    id             bigint auto_increment
        primary key,
    agent_id       varchar(64)                 not null comment '代理ID',
    sett_amount    decimal(10, 2) default 0.00 null comment '申请结算金额',
    sett_fee       decimal(10, 2) default 0.00 null comment '手续费',
    remit_amount   decimal(10, 2) default 0.00 null comment '打款金额',
    account_type   char           default '1'  null comment '账户类型:1微信，2支付宝，3银行卡',
    alipay_name    varchar(100)   default ''   null comment '支付宝名称',
    alipay_account varchar(100)   default ''   null comment '支付宝账号',
    sett_status    char           default '1'  null comment '状态:1等待审核，2已审核，3审核不通过，4已打款，5打款失败',
    create_by      varchar(64)    default ''   null comment '创建者',
    create_time    datetime                    null comment '创建时间',
    update_by      varchar(64)    default ''   null comment '更新者',
    update_time    datetime                    null comment '更新时间'
)
    comment '结算表';

create index agent_id
    on `tianyin_admin`.tianyin_sett_record (agent_id);

create table `tianyin_admin`.tianyin_zhike_config
(
    id          bigint auto_increment comment '直客通道配置ID'
        primary key,
    zhike_name  varchar(255) default ''  not null comment '通道名称',
    app_id      varchar(255)             null comment 'APPID',
    app_secret  varchar(255) default ''  null comment '直客秘钥',
    req_url     varchar(255) default ''  null comment '直客地址',
    member_id   varchar(255) default ''  null comment '关联会员ID',
    order_state char         default '1' null comment '是否支持同步订单状态（0不支持；1支持）',
    order_back  char         default '1' null comment '是否支持推单（0不支持；1支持）',
    syn_data    char         default '1' null comment '是否支持同步作品数据（0不支持；1支持）'
)
    comment '直客通道配置' row_format = DYNAMIC;






INSERT INTO tianyin_admin.`gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1,'tianyin_agent','代理信息表',NULL,NULL,'Agent','crud','com.ruoyi.agent','agent','agent','代理信息','tianyin','0','/','{}','admin','2021-06-23 08:59:19','','2021-06-23 11:47:40',NULL),(2,'tianyin_member','会员信息表',NULL,NULL,'Member','crud','com.ruoyi.member','member','member','会员信息','tianyin','0','/','{}','admin','2021-06-23 08:59:20','','2021-06-23 15:34:20',NULL),(3,'tianyin_focus_notice','焦点图管理表',NULL,NULL,'FocusNotice','crud','com.ruoyi.system','focus','notice','焦点图管理','tianyin','0','/','{}','admin','2021-06-23 09:49:30','','2021-06-23 16:07:09',NULL),(4,'tianyin_goods','商品表',NULL,NULL,'Goods','crud','com.ruoyi.goods','goods','goods','商品','tianyin','0','/','{}','admin','2021-06-25 09:50:19','','2021-06-25 11:04:08',NULL),(5,'tianyin_orders','订单信息表',NULL,NULL,'Orders','crud','com.ruoyi.member','member','orders','订单信息','ruoyi','0','/','{}','admin','2021-06-25 12:44:50','','2021-07-15 11:38:53',NULL),(6,'tianyin_orders_agent','订单分配表',NULL,NULL,'OrdersAgent','crud','com.ruoyi.agent','agent','orders','订单分配','ruoyi','0','/','{}','admin','2021-06-25 21:54:29','','2021-06-25 22:02:21',NULL);


INSERT INTO `tianyin_admin`.tianyin_zhike_config (id, zhike_name, app_id, app_secret, req_url, member_id, order_state, order_back, syn_data) VALUES (5, '自营', '22051022490003F8', '79a4e0f17039e5ec8071e24e937bb9a84b3f53bc', 'http://gh.ygcm1000.com', 'f973509176b847fe9e8d3e89d88d5475', '0', '0', '0');
INSERT INTO `tianyin_admin`.tianyin_zhike_config (id, zhike_name, app_id, app_secret, req_url, member_id, order_state, order_back, syn_data) VALUES (6, '自营快手', '22070916450004DB', '2cd5afabd70f3a03460ccbdeb092266aa882d5ff', 'http://gh.ygcm1000.com', 'f973509176b847fe9e8d3e89d88d5475', '0', '0', '0');
INSERT INTO `tianyin_admin`.tianyin_servicer (id, servicer_account, wx_code, alipay_code) VALUES (1, 'ytlyy888888', 'http://houtai.ygcm166.com/profile/uploadBase/2022/02/25/40d8c63c-512a-437a-9e51-28ce7b62aa07.jpg', 'http://houtai.ygcm166.com/profile/uploadBase/2022/02/25/af4444bc-81cd-452f-8732-aeb16f682d30.jpg');





INSERT INTO `tianyin_admin`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, app_id, private_key, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (1, 100, 'admin', '天音科技', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2021/10/11/59cfd957-f09a-4760-ad3b-5439522e8690.jpeg', '$2a$10$HieNrxTICzq2vWQyuMx0tOFfK2V3NV7/cM4OrTZIWvbEuqTHnZeLq', '', '', '0', '0', '171.14.69.196', '2023-06-12 11:32:20', 'admin', '2021-06-21 19:55:21', '', '2023-06-12 11:32:19', '管理员');
INSERT INTO `tianyin_admin`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, app_id, private_key, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (8, 100, '财务', '财务', '00', '188888888@qq.com', '18888888888', '1', '', '$2a$10$fMyJzGnmDFjwsOmgQDgZJOxHwt6b7GLJrwdE0pdYrk/NjotATbJoe', '', '', '0', '2', '', null, 'admin', '2022-04-18 22:43:49', '', null, null);
INSERT INTO `tianyin_admin`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, app_id, private_key, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (9, 100, '财务1', '财务1', '00', '1888888@qq.com', '18888888889', '1', '', '$2a$10$ffZS8fajkPy44DlvHwLWQ.eVsybcPISBxY.Gx8cbbNYfbg0YydS9e', '', '', '0', '2', '111.165.161.1', '2022-05-16 21:47:55', 'admin', '2022-04-18 22:47:58', '', '2022-05-16 21:47:55', null);
INSERT INTO `tianyin_admin`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, app_id, private_key, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (10, 100, '传单', '传单', '00', '123456789@qq.com', '18703939999', '1', '', '$2a$10$6v1ejiN4EmXwa5Wbpp6qvOtU2CXht.l/QWg0s3O3zmd/ugJUIE89a', '', '', '0', '2', '182.116.246.82', '2022-07-23 09:17:50', 'admin', '2022-04-20 01:49:05', 'admin', '2022-07-23 09:17:50', null);
INSERT INTO `tianyin_admin`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, app_id, private_key, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (11, 100, '审核', '审核', '00', '123456@qq.com', '15656589658', '1', '', '$2a$10$VLXr8PuwkZ4hqUF36lCD2ufcU6FdEmUADZtPG/bRakCENp1D2fvji', '', '', '0', '2', '222.136.94.78', '2022-12-31 17:42:59', 'admin', '2022-04-20 02:16:05', 'admin', '2022-12-31 17:42:58', null);








INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (591, 'e46b2d3b83224f739de090ea01e894e5', 10.00, 0.00, 10.00, '2', '2', 'e46b2d3b83224f739de090ea01e894e5', '2022-02-25 00:13:29', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (592, 'e46b2d3b83224f739de090ea01e894e5', 111.00, 0.00, 111.00, '2', '3', 'e46b2d3b83224f739de090ea01e894e5', '2022-02-25 00:17:17', '', '2022-02-25 00:17:25');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (593, '37257eb3c67d4dd7ad9ce3877a923038', 200.00, 0.00, 200.00, '2', '3', '37257eb3c67d4dd7ad9ce3877a923038', '2022-03-21 00:10:52', '', '2022-03-21 00:11:16');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (594, '00b80cac58574b4ab0b4a37a0ad78277', 315.00, 0.00, 315.00, '2', '2', '00b80cac58574b4ab0b4a37a0ad78277', '2022-03-21 00:11:55', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (595, '2788646ba4754eb0adcfdbd11a047696', 10.00, 0.00, 10.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-21 00:36:13', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (596, '2788646ba4754eb0adcfdbd11a047696', 210.00, 0.00, 210.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-21 13:48:11', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (597, '2788646ba4754eb0adcfdbd11a047696', 10.00, 0.00, 10.00, '2', '3', '2788646ba4754eb0adcfdbd11a047696', '2022-03-22 09:35:05', '', '2022-03-22 18:29:02');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (598, '2788646ba4754eb0adcfdbd11a047696', 220.00, 0.00, 220.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-22 18:26:10', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (599, '2788646ba4754eb0adcfdbd11a047696', 210.00, 0.00, 210.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-23 13:16:30', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (600, '2788646ba4754eb0adcfdbd11a047696', 210.00, 0.00, 210.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-24 09:44:46', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (601, '2788646ba4754eb0adcfdbd11a047696', 210.00, 0.00, 210.00, '2', '2', '2788646ba4754eb0adcfdbd11a047696', '2022-03-24 22:56:02', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (602, '3e815ed56a8d4d1a9a65e5bff82ee500', 50.00, 0.00, 50.00, '2', '3', '3e815ed56a8d4d1a9a65e5bff82ee500', '2022-03-25 18:31:02', '', '2022-03-29 23:07:43');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (603, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '2', '00b80cac58574b4ab0b4a37a0ad78277', '2022-03-29 23:08:37', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (604, '37257eb3c67d4dd7ad9ce3877a923038', 200.00, 0.00, 200.00, '2', '2', '37257eb3c67d4dd7ad9ce3877a923038', '2022-04-03 18:15:28', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (605, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '2', '00b80cac58574b4ab0b4a37a0ad78277', '2022-04-06 12:10:46', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (606, 'a1926dfe40cf4a12b15c53db0bd89d70', 10.00, 0.00, 10.00, '2', '3', 'a1926dfe40cf4a12b15c53db0bd89d70', '2022-04-06 12:21:17', '', '2022-04-09 16:59:58');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (607, 'a1926dfe40cf4a12b15c53db0bd89d70', 10.00, 0.00, 10.00, '2', '3', 'a1926dfe40cf4a12b15c53db0bd89d70', '2022-04-06 12:21:47', '', '2022-04-09 16:59:56');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (608, 'a1926dfe40cf4a12b15c53db0bd89d70', 10.00, 0.00, 10.00, '2', '3', 'a1926dfe40cf4a12b15c53db0bd89d70', '2022-04-06 12:21:57', '', '2022-04-09 16:59:54');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (609, '37257eb3c67d4dd7ad9ce3877a923038', 200.00, 0.00, 200.00, '2', '2', '37257eb3c67d4dd7ad9ce3877a923038', '2022-04-09 16:56:57', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (610, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '2', '00b80cac58574b4ab0b4a37a0ad78277', '2022-04-13 18:29:02', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (611, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '2', '00b80cac58574b4ab0b4a37a0ad78277', '2022-04-19 11:25:38', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (612, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '3', '00b80cac58574b4ab0b4a37a0ad78277', '2022-04-25 01:29:51', '', '2022-05-03 14:13:27');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (613, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '3', '00b80cac58574b4ab0b4a37a0ad78277', '2022-04-28 23:56:39', '', '2022-05-03 14:13:24');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (614, '00b80cac58574b4ab0b4a37a0ad78277', 200.00, 0.00, 200.00, '2', '3', '00b80cac58574b4ab0b4a37a0ad78277', '2022-05-03 09:07:14', '', '2022-05-03 14:13:25');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (615, '031808ec024e4aedb09f14157b8c536b', 50.00, 0.00, 50.00, '2', '3', '031808ec024e4aedb09f14157b8c536b', '2022-05-04 15:47:18', '', '2022-07-10 16:56:48');
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (621, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-07-31 23:14:13', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (622, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-01 11:46:30', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (623, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-01 11:46:31', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (624, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-01 11:46:31', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (625, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-01 11:46:31', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (626, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-02 10:53:42', '', null);
INSERT INTO `tianyin_admin`.tianyin_member_trade (id, member_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time) VALUES (627, '416e8af137954f198c0558492f41562e', 10.00, 0.00, 10.00, '2', '1', '416e8af137954f198c0558492f41562e', '2022-08-02 10:53:48', '', null);


INSERT INTO `tianyin_admin`.tianyin_member (member_id, login_name, recom_number, password, nick_name, phone_number, sex, avatar, wx_open_id, wx_union_id, wx_account, email, country, province, city, amount, first_member_id, private_key, is_free, status, del_flag, create_time, update_by, update_time, remark) VALUES ('031808ec024e4aedb09f14157b8c536b', 'fc666666', 10014, '$2a$10$B/uzympgz4lNAfAvWs.qHeijagLgR4G15k39mDOyJSeiQkRJwQDJq', '', '', '2', '', '', '', '', '', '', '', '', 96299479.57, '', 'MZBCKKH5YP1LM6WFTLRG4RWVZYOSI74MPCRQ7MBMXWSKCPFGGEQ32EIDSWDNR0VJXHLIPXD5TLCKZK0B4FDDCD2TQCOOVZWAURBZVNKYVUQ9ZJHTLKGXCMX1PDHFHDN1', '1', '0', '0', '2022-03-31 16:05:51', 'admin', '2022-04-19 17:30:30', null);
INSERT INTO `tianyin_admin`.tianyin_member (member_id, login_name, recom_number, password, nick_name, phone_number, sex, avatar, wx_open_id, wx_union_id, wx_account, email, country, province, city, amount, first_member_id, private_key, is_free, status, del_flag, create_time, update_by, update_time, remark) VALUES ('f973509176b847fe9e8d3e89d88d5475', 'YG', 10005, '', '', '', '2', '', '', '', '', '', '', '', '', 11778032.30, '', 'GSNXX1EQ6IUPYQQY0W49PGQLSXLOGWJWCVBQP9RS1MZV0LZQKNRCSRXF7YMUDEPZF7WMVH8JIJD8NOGEC8HY0EXXUU4JPPOXWBWSEB0CL8920RGC5PM1LSOPQZM0DXJO', '1', '0', '0', '2022-02-25 20:06:28', '', null, null);




INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('2d3cabc270d14f2ebeffe4ab7c06e32f', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/6df2ecca-4556-4113-a9ae-2627481a1536.png', '1', 'D楼中楼围绕评论', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE4B88BE58D95E696B9E5BC8F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68F90E58D95E697B6E997B43C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4B88BE58D95E5908EE7AB8BE58DB3E5819AE58D95E380823C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6ADA3E5B8B8E59D87E9809F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223E323030E69DA12FE5B08FE697B6266E6273703B266E6273703BE5BD93E5A4A9E8AEA2E58D95E5BD93E5A4A9E6B885E5AE8C3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE6B4BBE8B783E79C9FE4BABA2FE5B8A6E5A4B4E5838FE8B584E69699393525E5B8A6E4BD9CE593812F31E69CBA31E58DA13149503C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE5889DE5A78BE8AF84E8AEBAE5A4A7E4BA8E3130E69DA1E79A84E4BD9CE59381E5BF85E9A1BBE7BDAEE9A1B6E8AF84E8AEBA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE6AF94E5A682E8A681E59CA8E2809CE5BCA0E4B889E2809DE79A84E8AF84E8AEBAE4B8ADE8AF84E8AEBAEFBC8CE698B5E7A7B0E6A186E5B0B1E5A1ABE5BCA0E4B8893C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE68A96E99FB3E6A5BCE4B8ADE6A5BCE59BB4E7BB95E4BD9CE59381E8AF84E8AEBA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B5A0E98081E8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8B5A0E98081313830E7A792E4BBA5E4B88AE79C9FE4BABAE692ADE694BEE9878F3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE5A682E99C80E9878DE5A48DE4B88BE58D95EFBC8CE5BF85E9A1BBE5AE8CE68890E5908EE5868DE4B88B3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6A0BCE5BC8FE8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8AF84E8AEBAE4B880E8A18CE4B880E69DA12CE68896E88085E794A8222322E58886E589B2EFBC8CE6AF8FE58FA5E69C80E5A49A3230E5AD973C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B8EFBC8CE8AF84E8AEBAE58685E5AEB9E8AFB7E887AAE8A18CE6A380E69FA5EFBC8CE5A682E5B8A6E69C89E58F8DE58AA8E38081E69AB4E58A9BE38081E889B2E68385E38081E8B0A3E8A880E38081E8B49FE99DA2E38081E4BABAE8BAABE694BBE587BBE38081E5BC95E6B581E7AD89E4B88DE889AFE58685E5AEB9EFBC8CE4B880E5BE8BE4B88DE98080E4B88DE689A7E8A18C3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE694AFE68C81E5B08FE9BB84E8BDA62DE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F73746F7267652E7A68696B6573686F702E636E2F366535643764313766636564386132303763643139633633353761613838323662306666643531342F30376562323763633934333239633933326435653633623666376363363734312E6A706567223E3C2F703E, 999736658, 0.15, 0.13, '', 259161, '1', 0, 2000, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2021-10-03 09:50:49', '', '2022-11-15 16:00:00');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('576f0dd4eba54aceaaa2b4ff979e73f5', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2022/01/10/83e6f8fa-7035-4f64-a6a2-32ad37116bb4.png', '1', 'K@评论', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE4B88BE58D95E696B9E5BC8FEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE68F90E58D95E697B6E997B4EFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4B88BE58D95E4B98BE5908EE7AB8BE588BBE5A484E79086E380823C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE6ADA3E5B8B8E59D87E9809FEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223E323030E69DA12FE5B08FE697B6266E6273703B266E6273703B20E4B88AE999903530303C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE8B4A8E9878FE8AFB4E6988EEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE6B4BBE8B783E79C9FE4BABA2FE5B8A6E5A4B4E5838FE8B584E69699393525E5B8A6E4BD9CE593812F31E69CBA31E58DA13149503C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE59586E59381E8AFB4E6988EEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE99A8FE69CBA40E5A5BDE58F8B3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE8B5A0E98081E8AFB4E6988EEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8B5A0E98081313830E7A792E4BBA5E4B88AE79C9FE4BABAE692ADE694BEE9878F3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE5A682E99C80E9878DE5A48DE4B88BE58D95EFBC8CE5BF85E9A1BBE5AE8CE68890E5908EE5868DE4B88BEFBC88E4B88AE9999032303030EFBC893C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE4B88BE58D95E6B3A8E6848FEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE594AEE5908EE8AFB4E6988EEFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE6B3A8E6848FE4BA8BE9A1B9EFBC9A3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B8EFBC8CE8AF84E8AEBAE58685E5AEB9E8AFB7E887AAE8A18CE6A380E69FA5EFBC8CE5A682E5B8A6E69C89E58F8DE58AA8E38081E69AB4E58A9BE38081E889B2E68385E38081E8B0A3E8A880E38081E8B49FE99DA2E38081E4BABAE8BAABE694BBE587BBE38081E5BC95E6B581E7AD89E4B88DE889AFE58685E5AEB9EFBC8CE4B880E5BE8BE4B88DE98080E4B88DE689A7E8A18C3C2F7370616E3E3C2F703E, 9479769, 0.10, 0.10, '', 520230, '2', 0, 500, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2022-01-10 15:40:37', '', '2023-02-13 19:05:19');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('57df6904bd004421ab57482279219bdd', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/24427cbf-870a-4fa7-9008-092b51833f84.jpg', '1', 'K自定义评论+点赞', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C68333EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68EA5E58D95E697B6E997B43C2F7370616E3EEFBC9AE697A9E4B88A30303A30302D32343A303020E585B6E4BB96E697B6E997B4E6AEB5E4B88BE58D95E6ACA1E697A531313A3030E5BC80E5A78BE6B885E58D953C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE5819AE58D952FE5B8A6E5A4B4E5838FE8B584E69699E983A8E58886E5B8A6E4BD9CE593813C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE79C8BE4BD9CE59381E59BB4E7BB95E4BD9CE59381E58685E5AEB9E8AF84E8AEBA3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE58FAFE4BBA5E9878DE5A48DE4B88BE58D95EFBC8CE4B88DE4BC9AE59083E9878F3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9AE4B88BE58D95E695B0E9878FE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE78AB6E68081E8AFB4E6988E3C2F7370616E3EEFBC9A3C2F68333E3C68333EE5B7B2E4BB98E6ACBEEFBC9DE68E92E58D95E4B8AD266E6273703BE5A484E79086E4B8ADEFBC9DE5819AE58D95E4B8AD20E5A484E79086E4B8ADE79A84E8AEA2E58D95E5BD93E5A4A9E983BDE4BC9AE5AE8CE688903C2F68333E3C68333EE5A484E79086E4B8ADE78AB6E68081E7A8B3E5AE9AE697B6E9809F323030EFBC8CE5AE8CE68890E58FAFE4BBA5E7BBA7E7BBADE4B88BE58D953C2F68333E3C68333E3C62723E3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9AE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B83C2F68333E3C68333EE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F68333E, 9827579, 0.13, 0.13, '', 172420, '2', 0, 500, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'tianyin', '2021-11-26 13:25:37', '', '2023-02-13 19:05:30');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('5e01ae2fd97d469bb60790fa6b79df59', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/39ac59ae-fe5d-43fd-acdf-b93d1448033a.jpg', '1', 'K围绕评论+点赞', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C68333EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68EA5E58D95E697B6E997B43C2F7370616E3EEFBC9AE697A9E4B88A30303A30302D32343A303020E585B6E4BB96E697B6E997B4E6AEB5E4B88BE58D95E6ACA1E697A531313A3030E5BC80E5A78BE6B885E58D953C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE5819AE58D952FE5B8A6E5A4B4E5838FE8B584E69699E983A8E58886E5B8A6E4BD9CE593813C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE79C8BE4BD9CE59381E59BB4E7BB95E4BD9CE59381E58685E5AEB9E8AF84E8AEBA3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE58FAFE4BBA5E9878DE5A48DE4B88BE58D95EFBC8CE4B88DE4BC9AE59083E9878F3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9AE4B88BE58D95E695B0E9878FE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE78AB6E68081E8AFB4E6988E3C2F7370616E3EEFBC9A3C2F68333E3C68333EE5B7B2E4BB98E6ACBEEFBC9DE68E92E58D95E4B8AD266E6273703BE5A484E79086E4B8ADEFBC9DE5819AE58D95E4B8AD20E5A484E79086E4B8ADE79A84E8AEA2E58D95E5BD93E5A4A9E983BDE4BC9AE5AE8CE688903C2F68333E3C68333EE5A484E79086E4B8ADE78AB6E68081E7A8B3E5AE9AE697B6E9809F323030EFBC8CE5AE8CE68890E58FAFE4BBA5E7BBA7E7BBADE4B88BE58D953C2F68333E3C68333E3C62723E3C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9AE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F68333E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B83C2F68333E3C68333EE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F68333E, 9694999, 0.13, 0.13, '', 305000, '2', 0, 500, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'tianyin', '2021-11-26 13:24:31', '', '2023-02-13 19:05:38');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('81165822072147eb8901b5ceef64c8bf', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/754e056a-e1c1-4ef7-af82-f668e6cfaab9.png', '1', 'K自定义评论', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C703EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68F90E58D95E697B6E997B43C2F7370616E3EEFBC9AE697A9E4B88A31303A30302D30323A3030266E6273703B266E6273703BE5B9B3E59D87352D3135E58886E9929FE68F90E4B880E6ACA1E58D953C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6ADA3E5B8B8E59D87E9809F3C2F7370616E3EEFBC9A323030E69DA12FE5B08FE697B6266E6273703B266E6273703BE5BD93E5A4A9E8AEA2E58D95E5BD93E5A4A9E6B885E5AE8C3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9AE6B4BBE8B783E79C9FE4BABA2FE5B8A6E5A4B4E5838FE8B584E69699393525E5B8A6E4BD9CE593812F31E69CBA31E58DA13149503C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE887AAE5AE9AE4B989E8AF84E8AEBA3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B5A0E98081E8AFB4E6988E3C2F7370616E3EEFBC9AE8B5A0E980813630E7A792E4BBA5E4B88AE79C9FE4BABAE692ADE694BEE9878F3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE5A682E99C80E9878DE5A48DE4B88BE58D95EFBC8CE5BF85E9A1BBE5AE8CE68890E5908EE5868DE4B88B3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6A0BCE5BC8FE8AFB4E6988E3C2F7370616E3EEFBC9AE8AF84E8AEBAE4B880E8A18CE4B880E69DA12CE68896E88085E794A8222322E58886E589B2EFBC8CE6AF8FE58FA5E69C80E5A49A3230E5AD973C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9AE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9AE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B8EFBC8CE8AF84E8AEBAE58685E5AEB9E8AFB7E887AAE8A18CE6A380E69FA5EFBC8CE5A682E5B8A6E69C89E58F8DE58AA8E38081E69AB4E58A9BE38081E889B2E68385E38081E8B0A3E8A880E38081E8B49FE99DA2E38081E4BABAE8BAABE694BBE587BBE38081E5BC95E6B581E7AD89E4B88DE889AFE58685E5AEB9EFBC8CE4B880E5BE8BE4B88DE98080E4B88DE689A7E8A18C3C2F703E3C703EE694AFE68C81E5B08FE9BB84E8BDA62DE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F703E, 998075187, 0.10, 0.10, '', 1919982, '2', 0, 2000, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2021-10-03 09:48:16', '', '2023-02-13 19:05:47');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('a6a36a9674ea494ab735082e4fcddc7c', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2022/01/14/05436a69-28f3-4089-80db-7cde07623ac5.png', '1', 'K围绕主题评论', '', '', 0x3C703E3C62723E3C2F703E, 99385571, 0.10, 0.10, '', 614428, '2', 0, 500, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'tianyin', '2022-01-14 00:02:02', '', '2023-02-13 19:05:06');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('b9bcf2246dc44c578325e3cc1063184e', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/706c4f23-37da-419b-b5bd-d13cfa289f05.png', '1', 'K围绕作品评论', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C703EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68F90E58D95E697B6E997B43C2F7370616E3EEFBC9AE697A9E4B88A31303A30302D30323A3030266E6273703B266E6273703BE5B9B3E59D87352D3135E58886E9929FE68F90E4B880E6ACA1E58D953C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6ADA3E5B8B8E59D87E9809F3C2F7370616E3EEFBC9A323030E69DA12FE5B08FE697B6266E6273703B266E6273703BE5BD93E5A4A9E8AEA2E58D95E5BD93E5A4A9E6B885E5AE8C3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9AE6B4BBE8B783E79C9FE4BABA2FE5B8A6E5A4B4E5838FE8B584E69699393525E5B8A6E4BD9CE593812F31E69CBA31E58DA13149503C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE59586E59381E8AFB4E6988E3C2F7370616E3EEFBC9AE79C9FE4BABAE79C8BE4BD9CE59381E59BB4E7BB95E4BD9CE59381E8AF84E8AEBA3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B5A0E98081E8AFB4E6988E3C2F7370616E3EEFBC9AE8B5A0E980813630E7A792E4BBA5E4B88AE79C9FE4BABAE692ADE694BEE9878F3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE5A682E99C80E9878DE5A48DE4B88BE58D95EFBC8CE5BF85E9A1BBE5AE8CE68890E5908EE5868DE4B88B3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9AE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9AE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9AE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B83C2F703E3C703EE694AFE68C81E5B08FE9BB84E8BDA62DE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F703E, 995059375, 0.10, 0.10, '', 4964764, '2', 0, 2000, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2021-10-03 09:46:59', '', '2023-02-13 19:05:53');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('c7dd4a57ba674cb8acb3c2d042d63e3f', 'http://houtai.ygcm166.com/profile/uploadBase/2022/02/25/d5abacd6-c89a-4dfc-8c17-15c66e79757f.jpg', '1', 'D围绕作品评论', '', '全部人工高质量账号手动评论，账号100%高清头像，100%资料完善！【头像资料签名地区】', 0x3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE4B88BE58D95E696B9E5BC8F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4BD9CE59381E993BEE68EA5E4B88BE58D95EFBC88E4B88BE58D95E993BEE68EA5E4B88DE8A681E5B8A6E4B8ADE69687EFBC893C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE68F90E58D95E697B6E997B43C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE4B88BE58D95E5908EE7AB8BE58DB3E5819AE58D95E380823C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6ADA3E5B8B8E59D87E9809F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223E323030E69DA12FE5B08FE697B6266E6273703B266E6273703BE5BD93E5A4A9E8AEA2E58D95E5BD93E5A4A9E6B885E5AE8C3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B4A8E9878FE8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE6B4BBE8B783E79C9FE4BABA2FE5B8A6E5A4B4E5838FE8B584E6969931303025E5B8A6E4BD9CE593812F31E69CBA31E58DA13149503C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE8B5A0E98081E8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8B5A0E98081313830E7A792E4BBA5E4B88AE79C9FE4BABAE692ADE694BEE9878F3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE5A682E99C80E9878DE5A48DE4B88BE58D95EFBC8CE5BF85E9A1BBE5AE8CE68890E5908EE5868DE4B88B3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE4B88BE58D95E6B3A8E6848F3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE58FAAE694AFE68C813130E79A84E5808DE695B0E4B88BE58D95EFBC8CE5A484E79086E4B8ADE78AB6E68081E4B88DE694AFE68C81E98080E58D953C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE594AEE5908EE8AFB4E6988E3C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE594AEE5908EE697B6E997B43234E5B08FE697B6EFBC8CE5B091E9878FE58FAAE8A1A5E68896E98080E4B880E6ACA1EFBC8CE5868DE68E89E4B88DE8A1A53C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283234392C203135302C203539293B223EE6B3A8E6848FE4BA8BE9A1B93C2F7370616E3EEFBC9A3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE8A786E9A291E58F91E5B883E8B685E8BF873230E58886E9929FE5868DE4B88BE58D95EFBC8CE981BFE5858DE8A786E9A291E69CAAE8BF87E5AEA1E6A0B8EFBC8CE8AF84E8AEBAE58685E5AEB9E8AFB7E887AAE8A18CE6A380E69FA5EFBC8CE5A682E5B8A6E69C89E58F8DE58AA8E38081E69AB4E58A9BE38081E889B2E68385E38081E8B0A3E8A880E38081E8B49FE99DA2E38081E4BABAE8BAABE694BBE587BBE38081E5BC95E6B581E7AD89E4B88DE889AFE58685E5AEB9EFBC8CE4B880E5BE8BE4B88DE98080E4B88DE689A7E8A18C3C2F7370616E3E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C68333E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203235352C2030293B223EE694AFE68C81E5B08FE9BB84E8BDA62DE695B0E68DAEE69A82E4B88DE5908CE6ADA5EFBC8CE69C89E689A7E8A18CE59BBE3C2F7370616E3E3C2F68333E, 92014151, 0.22, 0.22, '', 7985848, '1', 0, 2000, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2022-02-25 22:45:42', '', '2023-02-13 19:04:49');
INSERT INTO `tianyin_admin`.tianyin_goods (goods_id, pic_path, is_upload_pic, good_title, good_subtitle, goods_brief, goods_desc, goods_number, goods_price, goods_price_default, goods_unit, sell_volume, platform, min_purchase_num, purchase_num, goods_lock, is_need_hours, is_highlight, need_shenhe, third_platform, third_goods_sn, douyin_num_type, order_attribute, status, del_flag, create_by, create_time, update_by, update_time) VALUES ('cddb63fd1dd646aab11de1ebb83d1c4a', 'http://houtai.ygcm666.com/profile/uploadBase/2022/09/26/23ce1aa3-2671-43b6-ab66-dc8ad67f2562.png', '1', 'D混合评论', '混合评论', '1', 0x3C703E313C2F703E, 93719032, 0.20, 0.20, '', 4846590, '1', 0, 2000, '2', 'N', 'N', '1', '0', '', '', '0', '0', '0', 'admin', '2022-09-26 17:53:35', '', '2023-02-13 19:04:29');


INSERT INTO `tianyin_admin`.tianyin_focus_notice (notice_id, notice_title, pic_path, notice_content, status, create_by, create_time, update_by, update_time, remark) VALUES (2, '上线通知', 'http://houtai.tianyinchuanmei.com/profile/upload/2021/07/19/9fdfe7f0-c324-4e46-93d8-a90cee17e9ee.jpg', 0x3C68333EE4B89AE58AA1E7AE80E4BB8BEFBC813C2F68333E, '0', 'admin', '2021-06-23 16:37:10', 'admin', '2021-07-19 19:58:38', null);


INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (1, '2ae9752f65cc48e9a88c66db6c7ae225', 7.20, 0.00, 7.20, '1', '1', '', '2022-05-22 01:08:33', '', null, '群里做的，有执行图，没上后台', null);
INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (2, '949f18880935468786c8a6a6289ed0a2', 100.00, 0.00, 100.00, '1', '1', '', '2022-07-09 09:37:27', '', null, '7月2号提现未打款', null);
INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (3, '8d9f47a6b4874cb9b060d95605799224', 3.00, 0.00, 3.00, '1', '1', '', '2022-10-28 17:36:55', '', null, 'https://v.douyin.com/MSWTVxC/ 评论都在啊！', null);
INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (4, '131998e32e4449b4b76f36227c626837', 81.80, 0.00, 81.80, '1', '1', '', '2022-11-20 14:23:43', '', null, '提现', null);
INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (5, '8f2e646befd64a2f94363120ec473217', 2.00, 0.00, 2.00, '1', '3', '', '2023-05-10 20:28:17', '', '2023-05-10 20:47:21', 'https://v.douyin.com/UJAbEmN/这个链接完成评论了上传图片中不知道什么原因自动退单了', null);
INSERT INTO `tianyin_admin`.tianyin_agent_trade (id, agent_id, trade_amount, trade_fee, remit_amount, account_type, trade_status, create_by, create_time, update_by, update_time, remark, audit_time) VALUES (6, '8f2e646befd64a2f94363120ec473217', 2.00, 0.00, 2.00, '1', '3', '', '2023-05-10 20:33:15', '', '2023-05-10 20:47:16', 'https://v.douyin.com/UJUJWLj/这个链接已经做完评论 上传完图片点完成的时候 显示已退单，不知道为什么', null);


INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('01e008708cb547529d88cd924889fe63', 'qwe', 'qwe', '', '', '0', '', '$2a$10$Tm5xCqd0TIupytT6fMh07utBoHCBrt9XWM3BLAnm4QN9N6eh8UjO.', 1, 0.83, 0.00, '1', '', '', '2212151539268022739', 'NPVCM5QTPCHTSOBO90KMANIDZADJSVUHNC6P5GEDWRFG7KBUHAY33JFZ5PEYEF32MPL8QJTTS4PRWBNPMHXUKR3DREFROJJ0AYGNKV8RPMYZCHKGCRU4ZY6WP7XTHPTK', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-15 15:39:27', 'admin', '2023-04-02 18:17:07', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('04d83633a9004c41b1cef47054bb620a', '尹晨旭', '尹晨旭', '', '', '0', '', '$2a$10$GhVd.quvMxJx5AUHP8/z6eA42Zhw.3ZspEd1u/8R0nGpGPTmbR7QO', 20, 360.50, 360.00, '1', '', '', '2304141627168518082', 'RJN9V6OJ3FNYQEBYIJIF730V851TQIYDNGWSXYHPC6O3FBENAHFLN3OBNFVMTMS10ZXRKGDDYSLFC3EVAMCMDRPYO18NEDR6YU8IIXCHVWQIGTMZBSLYYPS4AKCGDKLJ', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-14 16:27:17', 'admin', '2023-05-08 19:00:17', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('0dffdb0a6a0746f28f8910016008ed83', '张青', '张青', '', '', '0', '', '$2a$10$RWTULBDL1PNLq18zKgWMF..PioXdc.7X8lpD7jwKHCENuNRlb3KNC', 20, 1861.03, 1700.00, '1', '张青 ', '', '2209161028598483695', 'CAVU65U8AVBFHJU0MFFAC4PIK3OZ2MTJ8MQ47VD17ET8T14FB2JYKBFOYMLHJW9T8QFPYEWYCIBHABDWCIWG7XEJESPNDR1RACE6HBKRSQYI72UX0JN3K40ICV3JY3UE', '', '0', '0', '0', '', null, 1, 'admin', '2022-09-16 10:29:00', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('0ffa774deec841f68cc1f473437847b0', '柠檬', '柠檬', '', '', '0', '', '$2a$10$uQhihEyM1C3oUZJwNt65N.HyMduvAhY.fH56CBqWj53cQaZM5qB4a', 20, 954.98, 0.00, '1', '', '', '2207292229091165726', 'WKZLJTZRDTAW6X8L6TM9PU394HOQ9UI64JWCJSGFJVENEEWWAPWEJPIRWPFNGOSAJILGRBMBQ1UQWLGRQ2NR4O4HUO38QKE9YHZEZODUOLDNPWUVE9DCDMCXBDFYJZUQ', '', '0', '0', '0', '', null, 11, '审核', '2022-07-29 22:29:09', 'admin', '2023-05-17 22:15:17', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1378ad529c1c475cb850d710e2b3a04b', '开心', '开心', '', '', '0', '', '$2a$10$uTvFe66t788hk2eqYr.nQO6UguBkGGkY3JiEurWigTdFupSjzrp.i', 20, 1.53, 0.00, '1', '', '', '', '', '', '0', '1', '0', '', null, 1, 'admin', '2022-05-09 23:53:02', 'admin', '2023-06-03 16:51:06', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('15037c8ff5614c90958a5ac1e42a71e3', '马隆', '马隆', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2022/12/14/77760ac6-4c77-452f-850b-d417c9d6f890.jpeg', '$2a$10$7W42KB2dYIC2oIgihKBOCe38mjPjdOMg2BJYWFe06FL83Zf0TlnLO', 1, 0.08, 0.00, '1', '', '', '2209181614336871172', 'AT0GNRI9DOCJFZ9U7TJ98L39AF3KH04MLBNTOHBTFXHMFFJE2WXJBC35APOJTGWWTZKF1ANZT1UUMHBEAKFPZHWKPQSORVUZ5J6MZNZAXOVA4MLJX16QLQ32ZIKSZCOT', '', '0', '1', '0', '', null, 1, 'admin', '2022-09-18 16:14:34', 'admin', '2023-04-02 18:29:11', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('155bf44bbc184d94bbf4c4299c538e5f', '辰辰', '辰辰', '', '', '0', '', '$2a$10$FZ7G5Re7tJ35QBcjxzkCue1WAaO2Np7pO4.HyFhzoXl3Th4Mhg6XG', 1, 76.68, 0.00, '1', '', '', '2302131854286138274', 'UYYCGYI65JP0ECG6PEITGH47KAJYZYCGM3TKRQZOF7YIOOIPUUGSPF0CA2I6J5DM2MGKQXYEBEBV9CDPZLQZYUCEWULYU30CGYWHMDTXRMWYRJC4BIBBH2N5XACOWQRV', '', '0', '1', '0', '', null, 1, 'admin', '2023-02-13 18:54:29', 'admin', '2023-03-01 18:39:06', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('18999ec3b920412d896edcb07d640de6', '小柠子', '小柠子', '', '', '0', '', '$2a$10$N3VUe8z7iZzKWgFQBOGOReQoR6mVh/6b4C6cXdOZS/tI8R0qi7c.2', 20, 34.00, 0.00, '1', '', '', '2306081358212927082', 'WA8LQIORWE7SST3MXAZVZSBGDN5UMHSBZLN1K2YUDPGZZLFAY3CYGUFE1BGONE42OK6NLRLVOMR4OCM1WQEANEU3DLEBOIMOF3O92NULVHUAMEPWA55A3ZA4DZPBBHIS', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-08 13:58:21', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1a3a3322589842959e0d168ceb2f1401', '王慧', '王慧', '', '', '0', '', '$2a$10$HQQCeYW/jutuuFsLFp0Xc.dCAZWlI4AFoFl0MmXqrJ7wpf8djtfFO', 20, 523.30, 0.00, '1', '', '', '2305131731249989636', 'QR0PAEN5AQA3JMFREHTPLTIHJKHSLDYFUREY7KHOITSABWJVLJGIMEWKC2NJSCR51BDPPHFR1FJEGDD4O3JRLXF7S66RKQOENRV2ASNFR0WO41JEOLNRMRFUUJTFJNWC', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-13 17:31:25', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1b4276855efb4948975005c6dd46374b', '燕', '燕', '', '', '0', '', '$2a$10$GoBqsLAqSjfrNWLObpoxOu//5M6yVax8Nw.7GKwfl0aW0Ine0OH7C', 1, 3.96, 0.00, '1', '', '', '2211302019369582334', 'XMW4L5YCUROAF3IQHOWKEMYYJLOKNAU3ZWYZ9OEVDAJLXDLGB7MSVEM731ZMN9WFD76VOPBLUMY0YL3KVNAQ9ZJRIVZG5EDYGMSF6SVSQREO725VPSTSG4O8THGOQ6A8', '', '0', '1', '0', '', null, 1, 'admin', '2022-11-30 20:19:37', 'admin', '2023-06-03 17:13:44', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1b604fe0310048cdb19382d7afccb5e5', '白雪', '白雪', '', '', '0', '', '$2a$10$UQbKxpoaAMJLQ5MLGhZvV.nY8bwbpiIVMw.upLxiCasUhG2JudlOy', 20, 479.10, 479.00, '1', '', '', '2304161113412534244', 'PVEL2UBH16MPZ5SELFVUWEAO3A2OS4A2BIGNYKYS0UWMYTCYN3T0NYPC0NP30YAJCEREEBNR7HTBDOM4X71YDSTXYCBKCGVN3FNQVELDHH428MKX2ADPZ4E58VMK6XVE', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-16 11:13:41', '', '2023-05-01 20:52:14', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1cb458997455437e8185a5725311a535', '潮汐', '潮汐', '', '', '0', '', '$2a$10$kQedJsYNd06xBZ3va0j44uItM8842/UsY4Q9GFa45rJrxy9gnRSjW', 20, 530.51, 0.00, '1', '', '', '2210091140123596253', 'NHA0T1TUMJYYV0MYUOWF5Y22MMEBYUKLQ59UPJ3IMA0VDIBOZGMEP38GPURKRKST9E42QGRS3IUQVEEDZU6XMQO3T01FDRPTTJFUKGP3ZXP56SN9NE25VQJ4GIDHYQT3', '', '0', '0', '0', '', null, 1, 'admin', '2022-10-09 11:40:12', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1e01f9a932c64dc5a3b3e57f0c2477ea', '王欢欢', '王欢欢', '', '', '0', '', '$2a$10$XX.m.q90MuC8mfUdYfhCXu7gYxd2S5ehtcBRz26FcLOCvrKjFglFO', 1, 23.88, 0.00, '1', '', '', '2212081634187767213', 'BRNE0WP0NWNSI4TTZPXOMKHKIUPH1CJAYUBZJFXFD5UA5DUBNATNY8Z2TJMK4NHBOOPWFYQPRU03ICP8TTIGPNZO3OOSFHUMTT4OB1S1WTB32D1CAGCR87JZWRZLPDKT', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-08 16:34:19', 'admin', '2023-04-02 18:27:51', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1e2d5692812e4bf4b5edd88397a06fe3', '执伞人', '执伞人', '', '', '0', '', '$2a$10$ds16SU0IdlG13EvhZlULsON1lt/k.Uxo4g9pNjSAtgrloWeduP6He', 1, 27.04, 0.00, '1', '', '', '2211241108571340503', 'QSMMEICELHMZQKFPVU5LY4XZQJHGVAAUKHMBMSTQOCL9IQGRARB8ZY0SX3CPXAHKVJXJGX0IADTWHVIZ2JWJNLV9MJ7YORT0Y2L4EKTZX3R012GNRYXJPLRIQHFZ5RMF', '', '0', '1', '0', '', null, 1, 'admin', '2022-11-24 11:08:57', 'admin', '2023-02-01 11:11:01', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('1e6505491feb4ab1819601dd7e27d01b', '恒丰3', '恒丰3', '', '', '0', '', '$2a$10$8Egz2rMzVbsCz6NzsWtYcusB7hbwUuWnpZdv/sPZcp3hPkvnyM8Va', 20, 0.00, 0.00, '1', '百分之20', '', '2207141545327767010', 'BWV9CMXFQS2IPX8APE7SP0YGMGSFH5OQHLRWKNNHDQKYBJNQCNNZYNRUQZWUPM7FHCZAFJX3HFQN6R7KNHANP54CSKID5FM6K50GVCFS7RKWXZUU2UG3KFGGKIUGJEHN', '', '0', '0', '0', '', null, 1, 'admin', '2022-07-14 15:45:33', 'admin', '2023-04-10 18:15:57', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('24491d7914c34d97931d563b1fdf0801', '琳琳', '琳琳', '', '', '0', '', '$2a$10$k5D94KXFM0vkD4Lvt6K9ZuMchAJp62d.x/Z9SbdFi8vOjhLXLlluS', 20, 260.00, 260.00, '1', '', '', '2305012033559307422', 'NOJMX2HOTY2XHNLMYHWRYTOLLHJWC3WUUGSOFZXVBWAMWWNE4O9JKTGEPSWMJXEEQZXCUTKXWZOFHICQFDBOYY8DPTGDKP9CO6JNF0IRU3VDUPSMSANAIRZ6IBYXEC1Q', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-01 20:33:56', 'admin', '2023-05-09 19:09:42', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('24c44a0910aa4c24a6dad6cc5bc22ca6', '刘金鹏', '刘金鹏', '', '', '0', '', '$2a$10$.WTMUtrfBzTphoBYm.uu4.X2x3umoU./xwZuXp7S.d9tprrUm5fRG', 1, 501.93, 0.00, '1', '', '', '2211231019181208345', 'DI4CMNK2HRSLSKFKEKJDOPUBCTC8X2IZ9D4XK37BUAVWAFCJKMKGSURJYBEIPLCEQZBJPKFNPNMCWAIPVFIGIT0BL5BJNK5MNBKTUROJWCSFCITH7PYZMMESUGQ7UAS6', '', '0', '1', '0', '', null, 1, 'admin', '2022-11-23 10:19:18', '审核', '2022-11-30 21:30:07', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('24fde2ca90b249248b743f978ea9497f', '刘青', '刘青', '', '', '0', '', '$2a$10$16Cr9q2fhVDDD1CUWSvik.tI/PWXnOJ4nF.zElVaZxsJl9aE.rLLS', 20, 11.00, 0.00, '1', '', '', '2305261736094819661', 'MM9XJU5YPSFC04AUTH0K7G7KN3AIVAEEJBVTMRBXCK1CBYGFHZYP1G3Z0LLXTOY7QNXPKMGRYEP7DUKZE6TOFQQCHXFAVE8J5HEKG3P4XXVASD4FCYYGHKF5N800M8BP', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-26 17:36:09', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('292a733f8afb4f23acc4a85371ecc9b0', '张恒', '张恒', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/05/19/aa6bcc93-705c-4b05-9399-380629dc2910.jpeg', '$2a$10$IiGqgX0IWOECiFWkvcflSeY6sWfIWg/oLzXx4bylEg3bro6CwMdEe', 20, 16.00, 0.00, '1', '', '', '2305191955473640518', '4O9XY7R6GQGNNXMS7ERKCN2NF1NVXGGYNNFM8IW21G5BDRVBLYOG8QB0J0SOUC9IMKFZNPTMUEZUBLJHSKJE4JP9YM3JE3KNFKLYFNIOAO5Y95OQU5LYHXNKLMHHCU6K', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-19 19:55:47', '', '2023-05-19 21:01:52', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('292b32408f344bfe8ecd981c2f429d6a', '巧克力', '巧克力', '', '', '0', '', '$2a$10$elwEgLZx6WBRQWkir4a47.Y5b7ZjdJuoidN/G4/nltuMylHRPkNpa', 20, 200.90, 200.00, '1', '', '', '2303051604206569036', 'SCCNT7J3BCJA7QUOYI8AJJZAZ0JXVJTE4SOPIX8HRYDP8KBJO4F9180KQHR47SHUHKKQFUO26XPEZ167BR7WQXWDHT0V4IO8ORDIA6LJGTPBLUOPGN2NWT7EEVEPNNZK', '', '0', '0', '0', '', null, 1, 'admin', '2023-03-05 16:04:21', 'admin', '2023-04-02 19:19:13', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('29de15823d204eef93b75355000a127e', '胡晓莹', '胡晓莹', '', '', '0', '', '$2a$10$VQSQEmZZ8UAvMCRBgsiLXOnkWUHhPAu/DueGD35EPijIGlQF4KK5m', 20, 197.50, 0.00, '1', '', '', '2304291322577013805', 'FGY8JDVMGYXNBVCGBQSOVLINCMJH2T7MCXHQDGR04OWSNBD6BYV04MWXE9WR8ZAVKEHEXKMPLFZ7JHIQLUJT7HHXIVXIK5FA29AATPAX1DY0HFBIAPNF5WEOYVXQCUEB', '', '0', '1', '0', '', null, 1, 'admin', '2023-04-29 13:22:58', 'admin', '2023-06-08 12:15:39', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2a32a88600794e519b96ee3a72a4da59', '恒丰', '恒丰', '', '', '0', '', '$2a$10$Asqpb1eC0oHk8J7GHv3ft.7nSMnBbKBEZ4ewa1QfH7zSUJ6Ide38e', 20, 0.00, 0.00, '1', '百分之20', '', '2207071903143482652', 'R6JJ873QSRRFUX1SAD5EZEFLS2ES0EECTKFWXJPRSTTZTHET1F3Y1FXRR1MGJBS3BJKV8PGODNJGEJGELZ66HRWPM8ULVBUHPCHFZVNB4ABLVK31G6KTMWIW1KNEWWYK', '1.71 Wzt:/ 复制打开抖音，看看【卖酒的五掌柜的作品】五粮液自由度 https://v.douyin.com/MMPTp8K//prod-api/api/agentPull/pushOrder', '0', '0', '0', '', null, 1, 'admin', '2022-07-07 19:03:14', 'admin', '2023-01-16 12:04:20', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2a54550a7b8547c6a170ffc10bed34e7', '白霜', '白霜', '', '', '0', '', '$2a$10$So/RpK3SmKhAsQuhGQfFjeNVWwC8x.Y1/rwFRp.9hE9t.dIOVEC.a', 20, 271.38, 0.00, '1', '', '', '2305101331000735667', 'TPVKYMNLBBAVSE4HZLMPWOYSPV9LBLF3SNB0F7VESN1HVGB5HBTQWRFZGQU08G7JDP9IZANDNYPUZYQU3YUBX9TNEEYELXWY9QKRFQG3V5XG3BZSWAMNIPBNIY9U6LPV', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-10 13:31:00', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2afa2f22c3bf4a59af10e1e3c71cc343', '元元', '元元', '', '', '0', '', '$2a$10$y2WqkuGVM26voFZ2IVSwpepdeoL0mg6Bwq3D2AaHntNcP9xl1pxTC', 20, 1001.33, 0.00, '1', '', '', '', '', '', '0', '0', '0', '', null, 1, 'admin', '2022-02-27 13:52:15', 'admin', '2023-04-03 10:02:02', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2b8474e510ff40558444eefeb984b006', '朱方亮', '朱方亮', '', '', '0', '', '$2a$10$i0y00nnQy3aRRMdL1GJUA.tFPL1WGrQZgzcQYdVkiBVlrXxMVBcim', 1, 0.00, 0.00, '1', '', '', '2211011833075115487', 'N066BR0KUTEN7OUBM0JV7AUTZGAT5FZN8BQTXXADSLX7RQHXRN1UDCMVREPDTKIKIHCZ1UPEODXNFGKZ3PSWVRSEZAQFL6EGFO1DKMPLPBHVOAGG9DTBP1PZ8EWCSC8U', '', '0', '1', '0', '', null, 1, 'admin', '2022-11-01 18:33:08', 'admin', '2023-04-02 18:14:19', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2ebd1e728efb4ed68df4d37a1ed0a1ff', '一鸣惊人', '一鸣惊人', '', '', '0', '', '$2a$10$ZM8HFR4WqUzNXgak2G3o2Oi8OI.yZV3riIZ4PGfB/jx8vjtAaMlQS', 20, 147.97, 147.00, '1', '', '', '2304151333039821138', 'PVRTE6E1KO75H5OQ6D04LL5W4CDFXLBNTFZ2FB35SSMDKXIG3LXFUFMFBOEJK2N0RBCLSXN9DZ1IESWOWNGO7UBDMXVLL2BZW6N1APWCF3SAKS0KP1TQKUP1UGWOBLYJ', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-15 13:33:04', 'admin', '2023-06-03 21:05:42', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('2feee7cc5756450ba35cdb8c2a60fd98', '两人帮', '两人帮', '', '', '0', '', '$2a$10$alZQzi4nQBqnj5qWdY68DOIK62Z5mfWZMCqwosqOdHRkzCs6Oei6K', 1, 189.35, 0.00, '1', '', '', '2302151613014323817', 'JKNMS0TWAGJCGNWFMHRBIHLGR41UHFXAV67DGLMDJZ8YHN13FMLW6MNEGZ2OPEY0WAC6EFGANBJXX1OKLTY1O7TEIITLJN70GCHDKRTAIGOSWFPZQOXWCGINWULT2B3D', '', '0', '1', '0', '', null, 1, 'admin', '2023-02-15 16:13:01', 'admin', '2023-04-02 18:20:30', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('324788c6ff8e43178cbd34e55ec4bfcc', '姚叶', '姚叶', '', '', '0', '', '$2a$10$f8NJnfxDCnrP03yl/Ml3/e0IwdrxgG7g9eCVX1SAqL2H2E02dppCG', 200, 301.32, 0.00, '1', '平台', '', '2205211512027578173', '5EAI1YXVTXULZWRDRNWOG49QVQBFHJLWL3L6EJD8KM04ORTXTVO3ZHSD0MNK4H1P5NHQSSYVAJJAVZXAI0QIK9GMZFMY2FPTCFOKPW8YKNYIXHZYHNK9UVCB87NBFIH8', '', '0', '0', '0', '', null, 10, '传单', '2022-05-21 15:12:03', 'admin', '2022-09-25 18:08:36', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('352d7a44740546398dcdddfeff748b20', '尼古拉斯', '尼古拉斯', '', '', '0', '', '$2a$10$xNcE42AkhvCTh7nKeMtJB.SgpzQ2xs5oEsi5cfsTTGsvbY4/3gVOq', 1, 0.00, 0.00, '1', '', '', '2209141131582747598', 'EKSA1DAM47HOYPVKNATDGIKXHLZ0D399D5SPLDISBO8FYBS0CNUAIFGFNF8XMEVX7YWQSU1YTIHWKOQI2WEFSAP2IVYFHL3UQLH5FFLBX7K2EMSDXKAMSMFLEF2MK3D2', '', '0', '1', '0', '', null, 1, 'admin', '2022-09-14 11:31:58', 'admin', '2023-03-01 21:14:41', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('35d9a21ac09a4c40be522c0b08179997', '蓝光', '蓝光', '', '', '0', '', '$2a$10$XLgBgr9m3b20i98fFG045OekkYXcHgTU1HvuGvjfyuY86X1y7zW7S', 20, 188.00, 0.00, '1', '', '', '2305191612390679351', '3L5V5QPWRJG4B8L96NCMGNW5LQDS1PUSHBQBK1XH2BS8ODUCT1CQTBT02ADL7LN5EUMRDIOCJI8HDEYEXHKJG9WKFYDPOZ7EPWLEIHE3KJ9PJMRT6INZHEBL8AVMHHEA', '', '0', '1', '0', '', null, 1, 'admin', '2023-05-19 16:12:39', 'admin', '2023-06-07 15:42:22', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('35dde4a540544929b89829baa6946a02', 'asd', 'asd', '', '', '0', '', '$2a$10$XhMTELFFSqG/N3QJBldCVeiaswWFyVLDgsRO0/.OL33orqtbsnq1O', 1, 162.05, 0.00, '1', '', '', '2301100949307503088', 'UWK8AY56VYLXQLFOXJQI73AOIHJOTBZUEELJX4JNEWIRH1M758JMHLGUNPG6LS8SUC7AZBY7MZE9KTSE2UU5HHQETSK0KGIOESGUGJGQQIV0X9YOE4HFCUBMXVY8CNXB', '', '0', '1', '0', '', null, 1, 'admin', '2023-01-10 09:49:31', 'admin', '2023-04-02 18:27:25', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('3832eadd8f364cb2bb91be909ab5ef43', '赵河阳', '赵河阳', '', '', '0', '', '$2a$10$w2ByqXZInA1lq/oCiMSafupW3XcbENI7/jJT01vyhIakMcXnQsiRi', 24, 777.32, 0.00, '1', '', '', '2304051258523597816', '8NQXOVZE7MWF5QLQ2FCWYGUF0QSBXJYZQBMIGKDDKR8XOLKZIDO2RJOHHTVMGKJCBDGJ46C9VPPHQANF5GE7WFR1SV4WQ1CWVUMNZ3KF1VLZPF87EUCDWXIOR1WDPRSB', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-05 12:58:52', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('384842fcf85e4f22aaa948637e54f127', '乔治', '乔治', '', '', '0', '', '$2a$10$ZHWlW3IRUqFiNj5HtdyXYuYKVaZEycfsJjvqOvGBoU1fvBrUNzBHy', 20, 333.28, 330.00, '1', '', '', '2306011344430524672', 'UB1LLKSGUA4DDKDBWYNDYXOMQTMUDKLE3AK2X5I3BCEYR1HNZFERPLZCOK7F108TXTL2H3TN9TIXYGJZMRFBBCQKCSCLPDWVNAFQ7LDHCPSRMIQKUYBOFKE3XVHQD2EI', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-01 13:44:43', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('38e1314ce06a4d3589ddbf63541f0034', 'wsl', 'wsl', '', '', '0', '', '$2a$10$blqUi698nYvWYn.EzcvyIuWYDNGucdfCmiTP4sXELE/0RgviR/YFy', 1, 46.06, 0.00, '1', '', '', '2211131526333016584', '09UDWRPPN5RCXITZSDK82QBX5VQYEUAYEXUCCW1EC3GL48NJSOR4II7YCUZ1OJBYH1TUYEIOYX8P13IRF4MPZZ4MMCJYAFMGB5WBZGXCWJ69WBSUHLRI1AWEYEZYKABW', '', '0', '1', '0', '', null, 1, 'admin', '2022-11-13 15:26:33', 'admin', '2023-04-02 18:28:15', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('3cccaed707c74d28ba4ab3415afe04a7', '学鹏', '学鹏', '', '', '0', '', '$2a$10$8.jJRhYCsB95MmuPeEIRnOa8x78jR4c8dQWWaCZUJvBzIHqJmyqGq', 20, 798.40, 0.00, '1', '', '', '2304271748590024078', 'STKOOT1MXHWKKCKJ44SXFLEFJRLQXRADJHSOGIZBFGZ1MN1PU0PI4W1I1PANKPUJKMY58O8U7RNWJ8OAXJBI9UQVU5SMN4KINGJAMHFHSTILJEDO3QHFALWAZRGTO4BQ', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-27 17:48:59', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('3ebbecde5d9f49efbb75d3b13493d26d', '阿田', '阿田', '', '', '0', '', '$2a$10$gJXf9E8jDFCwqL89ptgIgO..Otuylepq73.1Wf005w/qpJ/cTZBoy', 20, 0.90, 0.00, '1', '', '', '2304191309427648902', 'QSJDLQ1LD3DCJBOJLRUTUFMSTV9F4ETCUSVUVZXSGBFEQNEB542CYXF2Q1XSZWDLH13RG3Q4K0NQCZDJTPZQULZHVJ1TWDKPNZZFVRHHG2WPOJNPHCLSZJQTVB44MSUO', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-19 13:09:43', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('3f54176588fe45ab8a987b0996d40d34', '焦建业', '焦建业', '', '', '0', '', '$2a$10$5ZA0jP/2foEUrzgCK5byH.rNFpTnKvOsbP3dhw8ClTkojzXRfztSq', 20, 1774.10, 1000.00, '1', '', '', '2303210948170200859', 'CS7AXY5GOHP4DRT8T9VFVFHFNBEA2S2BFKJROQKUAEEBCPH8XA3Z2ADIKN7BYQ5BBEVZYWN7IKYTKVZJMNTRKLOK2KGULHYGNAUMOM2QLD2HNJJ3S6S5MTBUPRNTO2IL', '', '0', '0', '0', '', null, 1, 'admin', '2023-03-21 09:48:17', 'admin', '2023-06-07 11:49:50', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('426f60629e1448e18cbd3645c54617c3', '安琪', '安琪', '', '', '0', '', '$2a$10$F433v.2g4USISw7Ljr4xleMxDUd/nDhyN4j0V5eriw0W8lObuHhGa', 20, 293.09, 280.00, '1', '', '', '2304252201564234571', 'N8EJSLPQHGJFFKKAZJQJ454HWTYSGDOV5ZO6LZN3ZUJWDPWZYRHXSVYRTODXLIDL59LA9MNDPHYSRR0TCJYDBUBRQMMZ1JOCBGFPI5OGXTQFW59X8TPWO8FNHQYKPKYB', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-25 22:01:56', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('46ab5531e0ee4530b60263e3b9a8af28', '李超', '李超', '', '', '0', '', '$2a$10$xsCqs2Z74JFTRnDtzd1jM.4bBAMG.ixuygzk5P.2GpjS7Ey6mnUlS', 20, 82.52, 0.00, '1', '', '', '2301011727420765956', 'VTDQSRSTQ4OPPBOWYXJYDJVH7IVQW9RKX2NUSREJZLPIZRPSPSEQ8I9ESDUAZIX03HE2T765FTO065EKUL3MT4LNJBJCLCD3V6TREPGEXS4HMJTKSTZLIT8KG9ACZ01Q', '', '0', '0', '0', '', null, 1, 'admin', '2023-01-01 17:27:42', 'admin', '2023-03-01 21:22:19', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('49350327cfdd4379a20b3be39c0fe8ac', '鲜鱼', '鲜鱼', '', '', '0', '', '$2a$10$KE0pDKDv86kGExYL4HLOde1VJpxRG.LVfOrgh0iBQjHhhsMG2dbIu', 20, 285.74, 285.00, '1', '', '', '2306021623455318573', 'PP3UUHV7EDLVQRSQMKWCRAEHHKDV77PT1UOQOW58K2J8OMWWHAXQGIWJPY1RCDD1VCIKMECB54R8UGXJDGQ9CBYSJSTLUR6CNIWUPFWEMACEJZ9LWNN7UNYB2NBXIHKN', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-02 16:23:46', '', '2023-06-02 22:33:44', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('4ef4cfe9da914e6dade81199b0136702', '吹风雨', '吹风雨', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/01/02/7717a436-daf0-4b36-a094-a5053de1b8f1.jpeg', '$2a$10$Pehi.FPlDQJ9UKLtlxqLju2TSRXFlhXgz6Jh2jU7A1avtsuzzoF16', 1, 0.90, 0.00, '1', '', '', '2210181248152387655', 'OPF4FW8BWETCIPPQHQIGVYCY5QA97L6TG4ZMG4JQR3QTEMWLGQMNDYEJ8RS0A5BZ54AWVBWD8DSLBBUJGNQPUIVUEUBKWBIRQAKPZMDCEQYRUT0N6FMGLFPQWOWLLXIK', '', '0', '1', '0', '', null, 1, 'admin', '2022-10-18 12:48:15', 'admin', '2023-02-01 11:16:23', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('50d28617ef6f431699d6c160945afe0d', '西瓜', '西瓜', '', '', '0', '', '$2a$10$61VP.IDx0X2AdsXXd0l/qehtDAL.UNblj3h/HsQ4t5yv8HT71Z49u', 20, 729.44, 700.00, '1', '', '', '2305011924204107182', 'LFS90PATNQNCI60UNA92OPVR6AKXXGSYBFZIDSIPNFBMNFWU14LICIJDV0C8JNHPXG37BKLZQFUN321CMU8USMZKKDUJMYKMR2158LLZNG2JIT0YHIJ2OCQCQ5FWN22S', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-01 19:24:20', '', '2023-05-31 13:36:57', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('52b4928b718d40cfb662debf21d9b27b', '闪电侠', '闪电侠', '', '', '0', '', '$2a$10$PMavQMI2TKHP/Mtsyy9jT.F49Fsgk17AnXzt8TcwBW44LTYR2BkIO', 20, 217.49, 210.00, '1', '', '', '2211201410346822452', 'Q3ZAYS1WRPLTXB2PYCZCOMGNUGUODCDLEPPRNB93DWEY56Z9BOILFNJIFPMCOGPZGH2SLGVTRC10HBFZAXNXK2AUCNZSJ8PQDPVOQKEWRW5JBC68PN84CBOH04IO1HPQ', '', '0', '0', '0', '', null, 1, 'admin', '2022-11-20 14:10:35', 'admin', '2023-05-04 09:34:56', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('53e71347de434ca6a8a0bca78542d350', '李杉', '李杉', '', '', '0', '', '$2a$10$3IWWR4n2tvdis8g6J0kN2u7q.YWGKUTMyQ2zZL8oYiY5x4ZlHZ6t.', 1, 0.00, 0.00, '1', '', '', '2210151010019140669', '0AJMB7XXXYDGTO4CWJQE8G50B47FRRMKDM3PBJYR3RIDCG2MT82IPWQYKEONTENCDBL5MDYEEUGDY9VZJBH25PWFEPEEYMULCGANMONNHZTTHNFTQNOPMPAYBZ403ICH', '', '0', '1', '0', '', null, 1, 'admin', '2022-10-15 10:10:02', 'admin', '2023-04-02 18:28:36', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('59a7ceaaeb50425182ab0883daca15ce', '韩学磊', '韩学磊', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/02/05/79b52073-fb83-4862-974d-66807202e2c8.jpeg', '$2a$10$SxyRaZJ2R5S1bdOlE9Ho0.SMuJwK8STkiCio2ySSCmgjKOCZVQyoK', 1, 10.67, 0.00, '1', '', '', '2212081234310686711', 'QI0MBXVE7KM0DGMR5A08IIM5ZYPZX1JSQA0X7OPFANWYNYOXB8XHSPOPSCNHGOAGFO5ITNMNJEHGQHYA6C03U2EXLJIL9HWPASCVPSTVYCE4KVPTI9DZEN9K0NSPGZ0L', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-08 12:34:31', 'admin', '2023-04-02 18:27:34', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('5c17ba0860e7486e97022a421ea73168', '小孙在这里', '小孙在这里', '', '', '0', '', '$2a$10$1IERtRVKzu4zd0gL0E3vJuZzC6Olpio5GH4raC7ffobO5TJX/7nte', 20, 156.37, 0.00, '1', '', '', '2303071411007983527', 'NZR8KJDLC1K8A2ZWX76RBEJWH6P3W1SV9UPZNLJ1G3Y12OWN2SUMAOUICAVAREHETC65TEMN11AOMB1DF4ZECY4PTWJ5BELWN3BMQTMOKN5FMRQCSNWGZH5SFHWKMDB9', '', '0', '0', '0', '', null, 1, 'admin', '2023-03-07 14:11:01', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6480af00f1534cd384eca6899776f648', '雅米橙1', '雅米橙1', '', '', '0', '', '$2a$10$tGe24zdy9V74eCXKRV5Bfu24buc7Qhyuzbk7YbsJ0NVJ9E74kLw7C', 20, 319.72, 300.00, '1', '', '', '2207082332495186426', 'FIMISW3QPEYSKXO5PFAGVYDEPO294PQUM95BWZIW42ZF0PL9T71TKPUVDBHJJQSVYGVA2NWDSGF0NTGQC0GN37BPLB0CPQQYCJPDDPFCCCOWSURGP1PYZVQWJUAFAELM', '', '0', '0', '0', '', null, 11, '审核', '2022-07-08 23:32:50', 'admin', '2023-04-01 12:04:12', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('65728f65ca9243259533e8190433bcef', '孔建岗', '孔建岗', '', '', '0', '', '$2a$10$gnP./QB3AOBUMuTQ5LT8L.wt36SWxOd7JUeIb8ZrrYSLcH6pEHBga', 20, 115.64, 0.00, '1', '', '', '2305291837264751825', 'WMSYDIWPPNDXM7WQLKBLNRM2TNVFTWQC0XTUD7IC2DYXDAARMHKWYPNZ8MNITKEK0FZVNCNBVUB1FZMPGDPZ1U0BRK7LVCNK82NEISQWCAXYDLXZ59RBYMY9GPF5F6RK', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-29 18:37:26', 'admin', '2023-06-01 09:46:57', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6953570e02b04be2a1da811e2c90ab06', '涛', '涛', '', '', '0', '', '$2a$10$euE9RBst5xWVBWErt95aoun/fzBECsOt9HY2RSIaMWDD2L5xE3qTK', 20, 792.60, 792.00, '1', '', '', '2304301907530161852', 'W5UOYEIIW7HD55OC3N3EOMIAIKKEIY3VRVHQJMBPZ9FOLNEKLJO3SDXGOXT7UKAHMPYNJUSCUQEOVEH0X1U6KB1ZUIJQLCMQD69U0IBXWI0QHG5V2PAOOBFWG2FFOKIE', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-30 19:07:53', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6a7c3ab162f949d5b0c2fea10ae350e0', '田亚芳', '田亚芳', '', '', '0', '', '$2a$10$7ZSsN326mYHxCCn2GaKHz.9X0VdpRzEtlKIYX3MMNmNtUlE.0YTQ6', 1, 0.00, 0.00, '1', '', '', '2212081103476046544', 'XOHPYY3LJDGJ45KLVDA6T5R7NABIZKFLNTFCLPWXA7KAV0CYOTCKJMQ2MMP12VFOFOEQS4YBKB0DPL2AOJUCSY8SQX8SLKUSHU6MLREIZ02WZY6FILY5F7LSDTPOM2SG', '', '0', '0', '0', '', null, 1, 'admin', '2022-12-08 11:03:48', 'admin', '2023-04-06 12:34:08', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6aacb97292494a29ac88686db7858e29', '亚伟', '亚伟', '', '', '0', '', '$2a$10$0vGeo3Nz.PNMofMfkH3S8.1aDPcjFv/0Af6/HH5rg/Wf84k6xeVRu', 20, 343.74, 0.00, '1', '', '', '2211302007258302315', 'Z3PQJF6KYNHHKIHIOWTGR7QYNXZCSWAWBQUNYMKAEKFTY6AB6IBKEXUODRSGONAPCZLOUU39ELGNMWWYS3FIJQQYUOKU481JLGETYDGXWYXCHXEAPMLKZXRNAXMX3PEJ', '', '0', '0', '0', '', null, 1, 'admin', '2022-11-30 20:07:26', 'admin', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6bc9d36eb0c04b74b3a22b5ef045c033', '忆白时', '忆白时', '', '', '0', '', '$2a$10$LnRWKgRvIfiHq8upHeMAyeINL97dH9YLRbTEULsCjO9BGiGCGltty', 1, 77.97, 0.00, '1', '', '', '2210141654587939260', 'MM5QIATUEHV2QZJY0GILPY3GY4OUX2RNBWRKNHEIWGFIQLRJZZSALWQHEPOFY7VZLMP2DVFTLLFZ6ISXFU9HD3BPCMZBKRLPADSRXRSJSHIJD0ONEVTUAZVKELIGFA4G', '', '0', '1', '0', '', null, 1, 'admin', '2022-10-14 16:54:59', 'admin', '2023-06-07 18:12:18', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6cc77dace7c6461893250923d3f5c14b', '过忘云芳', '过忘云芳', '', '', '0', '', '$2a$10$b6aYrRwdYgU5xLLJGqtAFuEI/G/y9hAUl0lexb8gXa0bPzpmd5hSe', 20, 183.70, 0.00, '1', '', '', '2305211503021813677', 'U91MYH5A71THIRS292K9ULIRKIANFUBAQ63RMGMHN2WLHBYJGW9NXN3AQK1HHIQQOREPK7MX7K5GA5MYJYPXN771GJ98YOU1ANAVSGEO4TJIEHFLOFTPJMVH7V6KO7UA', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-21 15:03:02', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('6e540e39fd664dde99171bc836f07b9e', '倩倩', '倩倩', '', '', '0', '', '$2a$10$tG7KnglVSCe7Dy0jVLHW7OaPZDSUDLyRNP0aLojyQpns5lJrtFl46', 20, 116.22, 0.00, '1', '', '', '2209021712380798126', '8POOARD8KSGHU42CYEHY8KHTG309CR8SJUQVDZEETLPKIXB9IOFKKGNRDPGL0IBUUNRSTAQVSZWDJWKXSRFSWEZJK3OIJGFSW0BOKEQM3OREU3V7H5CYJLZHGWARCQNY', '', '0', '0', '0', '', null, 1, 'admin', '2022-09-02 17:12:38', 'admin', '2023-04-03 10:59:29', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('71758df06c534d23871672a05e989264', '小鹏', '小鹏', '', '', '0', '', '$2a$10$r.7f2ryWKLoLIeNSp9jTWej8PvrsgAbwv4upi2sm3inEIWxiYZXEO', 20, 37.02, 37.00, '1', '', '', '2304091619515581301', 'IHB7FUVUUVK0GQ5UOHFA6CNNNBP3OIVYA52TSOLNURPZ5M7DVNEAKE2MUZZZUGDO2S01H6XGWQXOPSJDQS8DL1D9WUM6MEX1YFBXPBQ1AOQFATM4EYUU7DVCFPV4WNMH', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-09 16:19:52', '', '2023-04-16 19:46:06', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('769f60300b7c4be4a1a1cced50c51c95', '渔翁', '渔翁', '', '', '0', '', '$2a$10$8DP5g73NTlUTYyr507VLoupFPw4xFeb27OCHoyvfrYjzrfXnlLgva', 1, 9.52, 0.00, '1', '', '', '2302161346594276234', 'SQLDO1287FF15JXKJDYNXETRIVDKISIMHRJ8UZ9AQTLKFORUWTFAGRITDADTFAVLCX7UKYSVIM4WFMQ9ISAEBXIVGTWVTRYB1TO7ZARFMF0CCYEBGKDPIBROATMW1FNA', '', '0', '1', '0', '', null, 1, 'admin', '2023-02-16 13:46:59', 'admin', '2023-04-02 18:20:35', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('7836e86780b34585b328024171cddd3e', '杨世龙', '杨世龙', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2022/10/20/63d0a759-2543-4463-8b33-d7fbe03cede5.jpeg', '$2a$10$28rY9hW8O19BO0ysSrtyk.82zvqAA/rVoHnmUwd5yK0ESc0.mLkRG', 1, 5.32, 0.00, '1', '', '', '2209011641316555774', 'SSBE287HEKI2PRHURWUOXWJDG84IVZEEYBWXKPFWIJQZSRE9YLZ4THUL4BT0W12JWL7EEPNYAWCDEDIRSWNSI8JD4JZ5PI3JPR8JY1PQXRKSLDV4JPLLJR1LXZ8VTO6T', '', '0', '1', '0', '', null, 1, 'admin', '2022-09-01 16:41:32', 'admin', '2023-05-07 18:12:27', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('78474f1b45f04c1b8b3074de98eb2f39', '周亚杰', '周亚杰', '', '', '0', '', '$2a$10$rhLOcQi539Gyaswm8qsFw.7z48wsCkySCWnEkiAAehSTa../U5p66', 20, 289.34, 0.00, '1', '', '', '2302121412455894658', 'FM4K7RENTCJMYJOGRUZQDBPIZNAAN9OVKTCV1ZTC6DR1V1SLLWVWW8XKXPEQFZC5K5DBK7Z673JOAFZER0MLFM8CMJ49K4WFJNE9XNCOU6RNKBG10YERP981YV6M1FAZ', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-12 14:12:46', 'admin', '2023-05-27 21:40:08', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('78df37b994f34607a39b111b352f349e', '笑浮尘', '笑浮尘', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2022/11/28/38bf0d1f-efc6-4ee1-ab21-98d4a5af8827.jpeg', '$2a$10$jxBgC4CWU7.e36zqcnXrbu1mj3xtn5euNQAfxqAc5CdJfedpPj6c6', 20, 179.89, 175.00, '1', '', '', '2211211238182744314', 'F5NPLZZBM8S6NS1KFXJRN0MJGMIYDDU3BJHOZ9IPPP3AC4GAAD58GBZDFDPXGZ3WBMFDQHNHSN3YP2XYIMC7EMXCPE7QJ8EEV0REGEAXJPANP7E3ZCF2QAJDH96BKM68', '', '0', '0', '0', '', null, 1, 'admin', '2022-11-21 12:38:18', 'admin', '2023-05-15 18:34:09', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('7b538bc97e1541f1851656f14e1c27be', '恒丰2', '恒丰2', '', '', '0', '', '$2a$10$d/B/DvlaGie/5Tso67j44.HeBPuZtytiuHxFysuWnAvJPnLRzoh6y', 20, 0.34, 0.00, '1', '百分之20', '', '2210141351469278754', 'TURPHSTJFECAGEFSUHIFFENKJOTHWQVEEXVRHAFIRLX0M7N0JDE2OX5FM87DBPTYPFWFXIEULTGY1GDKEHFUGEQDNRRKLKLICIE0BQ4SOUTHGONVKBFKL84JIN2TQ53Z', '', '0', '0', '0', '', null, 1, 'admin', '2022-10-14 13:51:47', 'admin', '2023-04-10 18:19:43', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('7f32f653937e4f83bc94a2851062e410', '春根', '春根', '', '', '0', '', '$2a$10$W3GCNGAnz9gu6Av1WiQmAeJuzUWsMBjyV4cA0N6SfsORiTD80N5am', 20, 360.40, 360.00, '1', '', '', '2306011343422404667', 'VTRVD3QYDHCZOBEERDM79IP3LTZODRCNLD8GNA55B6ULS8IQCWWPDJ7XUPAPRUHXHH2ZKXPHPPC96WJL2MKYVMASYMFTWYI40TFCPOBIHDJN5FTJRTMPN4RNU4JRKEE2', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-01 13:43:42', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('83378b5417cb4842892cd0216f101d98', '小辉', '小辉', '', '', '0', '', '$2a$10$vIfmruEld0ASOgr95pAfSe40G37ieG9Av6ypT9ZQ0csDpKf4.iBqm', 20, 33.48, 0.00, '1', '', '', '2304281326239907898', 'CNC2ZK6BFOOMI0TWAK7KTIEO5WNGEWRGPJ2GPAGLKUGGWHTIG7ODVB05BHGCLHAVFTI0BSKA7EL5HLB2UK69FOJPJMPJK0NKLRBIV1O6KBMAFX0IOGFSUIGADA7O45WE', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-28 13:26:24', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('8500aa7fab06437ead992ef0ff775d6d', '都凤霞', '都凤霞', '', '', '0', '', '$2a$10$8Tcp2YTW/snLr6Q2PrvDmecfW5HYEQcCfGaG4pd/GGAkDJp2Wq4lu', 1, 0.00, 0.00, '1', '', '', '2212011439192693290', 'WUWMBAMYKQKPC1EOFF4QCMMCAJA6YAEDE75OQRC7MUMWCGINIYN5NSOFGVVE6HKYRZQWZ0QSBAGECSK3RGFP0YXBBQ2AQGHVCMJLFYNCNKUSFWMVNC6M4W6MMTL9JG0J', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-01 14:39:19', 'admin', '2023-04-02 18:15:47', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('88a5f20a6e32422abf2b46173b743324', '勇强', '勇强', '', '', '0', '', '$2a$10$gxyUqqX2pRh0m3bKEA3kiet0QDjA5aDBmSYaXvnRpYuQ6onuisrLq', 20, 140.40, 0.00, '1', '', '', '2304141220517577255', 'GN1SB8N1EEHQZHCHIIBXGF7KBGCJGPCZIF1H6TPH46APLPZMCTCEQ5QX8TOQCGJJORKIBEE1SU54NFEK1DYCVJ7BSBBKBENBM9F30IJDTT2YNUIDGA1STWJRDTZVGC5K', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-14 12:20:52', '', '2023-04-18 17:31:02', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('8b34abaeca7743229e2337bb75913e9e', '15239386762', '魏胜磊', '', '', '0', '', '$2a$10$zmDPGzHJJ2xAkum6Ov.2X.Dcg5d2DzgOr6d4MGVWBIeTfYcPpdY32', 1, 0.01, 0.00, '1', '', '', '', '', '', '0', '1', '0', '', null, 1, 'admin', '2022-03-08 12:19:48', 'admin', '2022-08-17 11:16:25', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('8f2e646befd64a2f94363120ec473217', '发子', '发子', '', '', '0', '', '$2a$10$jLF2iWqHSXcvS8.iglncAO.E/.EyO3P3JcM2MTe2/2j.NL7hTPwOm', 20, 329.80, 0.00, '1', '', '', '2305012047265487485', 'DI6L1JBLPCT8JYPXNVTBHYCU3T42SCU3PYT39RFG2ENVH2GYDPDDZCHVPBPHXBJWTQA0WOUOMN7DDQSGROVHNQBFRGIEHSJ3O6MUV3FCEIEXNTTNCANQDCGV2VR5UWWM', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-01 20:47:27', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('91e0688f41bd497fb47145765f8a8b2a', '段会歌', '段会歌', '', '', '0', '', '$2a$10$0R6KLAdTTGe.LJdtJShbt.LJ4oSf81eqT3BaYyVLOmVDB.WQTE9Uq', 20, 293.14, 0.00, '1', '', '', '2306021400175738028', 'HIZ84MWRZR0RHRH29KONRSXCYOX9IWMJIY8PT6ZFQ09OYG05GMGHGZSAO4VVOPFGCFT34CWHCCHMX7ZFMJVCTK6H1UGW1QIOVWB8FMQTRFVMI2RMCIKDUBFJXSV2D7IM', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-02 14:00:18', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('949f18880935468786c8a6a6289ed0a2', '壮', '壮', '', '', '0', '', '$2a$10$Wwe9Hp9R8L5mV1L8o4GIqu7lzZq7vdqSRJqURLFVVdT5gsHixQ7Ly', 1, 0.91, 0.00, '1', '', '', '2206071039139758065', 'LTQSNWPRBBA9ET8TETQBDZT0GTZTU4OA9O2VI0CLNCKEB9SNOYAPLAA0RTPQNGCNKB7E7BI89ED4VDWC0UEKC5XKJW3TEUMEENOEX4THFVDRRJLEPPHRJQMIQFKS5RAX', '', '0', '1', '0', '', null, 1, 'admin', '2022-06-07 10:39:14', 'admin', '2023-04-02 17:59:07', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('95ccbfe53eb340ee97c2d6aeabe2e443', '龙', '龙', '', '', '0', '', '$2a$10$2Wl8GSzDaFaqadenE7csPOhNHRQLH.4.DDb8XyTpLEmoQBfJOZ3Ga', 1, 15.50, 0.00, '1', '', '', '2303311932206493636', 'XGFBOZRBVBMZ4TNGAJF0TKSOTWXQQX6AF3EOVL7FTDREZPI8C11S5OGYTEZWCBYBIP9ECR1OUA2EVCSIBBO7E1PASIQSOZHVJ1JTKXJ5JDANU5Q58AFKVB6YFGX9HMTW', '', '0', '1', '0', '', null, 1, 'admin', '2023-03-31 19:32:21', 'admin', '2023-05-02 18:17:24', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('95e64b03a46f4dc8bbb0f9f1fb60d20e', '赵明瑞', '赵明瑞', '', '', '0', '', '$2a$10$0g4XE3kPyJXziR1/R88JeuUZ.Bi0PgouOCH6KylPnyngh9hzcbve6', 20, 1008.46, 1000.00, '1', '', '', '2302131156026457130', 'POAEK1OKGL3QP5WP9Y48MJMH5ZTUMD3L8RAKNM91VO4YJVFXIAGVWAKK37EB7JKHNFSBCOG2MDBC3TJ0A2BWOBVFTCWNWDLWJ8F0DJ64FESS10YBXDLDJLXZLQA0YDAD', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-13 11:56:03', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('978c1d5bd59e4c2c83679dc81016c5ae', '张太阳', '张太阳', '', '', '0', '', '$2a$10$sAM0wmHdj.S.0l/kOjFwquYDrf1lNGeJWGsyEmLqHlvP36vOlSQ7y', 1, 15.72, 0.00, '1', '', '', '2305012115293207585', 'O2PIWJC7GUZOOC7ZYDU4FNS32TZMTNA5RX3DLWBMCQSK1IER4QUCOWMNI1AZ8ACQBMB6WTXZPYCPDOGUD70HZTNSCWGSCNKPTU6DUDAEHNNERBHWC64X3LJYZF0LLDYP', '', '0', '1', '0', '', null, 1, 'admin', '2023-05-01 21:15:29', 'admin', '2023-06-03 17:13:13', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('9a07df54b62e47449605e9d3c87b2769', '15639355118', '牛牛', '', '', '0', '', '$2a$10$o6Bg9/3q/y7FeuJ5l1cvdO5l9iMiiQdAOV6b8qB8kQWI6sqvMyr62', 1, 584.16, 0.00, '1', '', '', '', '', '', '0,1', '1', '0', '', null, 1, 'admin', '2022-02-25 19:29:09', 'admin', '2023-01-02 15:21:16', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('9df54b4178584cc58f6c1ed596a69253', '孔燕', '孔燕', '', '', '0', '', '$2a$10$R01/y3m3ixTDHnWduoWriOq491vrWjbZ.h3TR1ayvJ26ZqvEw/zMS', 1, 4.81, 0.00, '1', '', '', '2212281512597526498', 'Z4ZE3WQ96THY23AENKH4XHEVIVGCY3DAUNTG0QN8XEH2NLL06IOQ8XNT6RFLXUPJWO3IUSDDVJCPHXZYS8ZRXQAUQCRYZBSHPBHFT7DQ4K1MXMF8INHZID3ZNIWWPGSX', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-28 15:13:00', 'admin', '2023-04-02 17:52:47', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('9edd6ed8d2f749a398867a1346a73da8', '莫忘', '莫忘', '', '', '0', '', '$2a$10$yrn0kMP7fO9l57zJilZjfOcpsM//UHUDv1zNYfVKXH/tuyDjXxLUG', 20, 608.49, 0.00, '1', '', '', '2302181430501932301', '9DSSFHSOXKWPSI7UV9T8MVPPC9WR9AAFRG3UXR8URLLUAEE9JMOFBWAAPHEALEAVUE5H4JKRHPIEJMRVZX6MMUYP3CJMLVYT4HXVDXX0FMEIR8OYXANLII0NKD7VNL1K', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-18 14:30:50', 'admin', '2023-05-01 17:21:01', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('9f495949204344929572f6d540db6590', '娜美', '娜美', '', '', '0', '', '$2a$10$EFXxn9q.Xy0NcelfungNGedVlT/tpCpY0pD3keYejSSjWCysb4D8C', 20, 2423.59, 0.00, '1', '', '', '', '', '', '0', '0', '0', '', null, 1, 'admin', '2022-04-16 18:34:52', '审核', '2022-05-09 12:51:22', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('a0128b6c13bc47ce94f09b8b2d49cd78', '白英格', '白英格', '', '', '0', '', '$2a$10$3PbUTeO4xbp3skm5oGvdl.mpbR4a9aqycKcYhboPl9qKUSapgbBC.', 20, 50.49, 0.00, '1', '', '', '2210221803109657504', 'EQHQ4FYTIRREMKJSS9OJVRH7T4WPO68RFIJN2ENWWJTDCTHWN2S5KUSI0YTQ00TM2XXXV7KMEEJRSXBCXUFNZPOKIAQU207BFBGJDB9CW2U4LWGE1WMBL7YOZM1T66AQ', '', '0', '0', '0', '', null, 1, 'admin', '2022-10-22 18:03:11', 'admin', '2023-04-07 09:07:58', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('a0c9d4bb905343b199cf3158d892b600', '辉', '辉', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/04/15/368d5837-51fb-41ba-bb5c-5af0a974c089.jpeg', '$2a$10$BkkWtJPTPWI2wWBGLgljZuKJfB5oc6bOSG8fJ7s10AWxxr02cDaPi', 20, 322.70, 0.00, '1', '', '', '2304152126531342731', 'ZJYZAJUYJEJXC77XT9MVE8ENMOPR3ADYLM1OYHIX8UW8IWRXDWPCTSLQBSDMW6KJMUBHLLOYHE72AE3KOF58OKIJX0QW6MLAITEY9AOZC93D3KIQWJ76M0K618YK3O84', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-15 21:26:53', '', '2023-04-15 22:04:14', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('a1edf6d636564f54affceebb0ba550dc', '虎子', '虎子', '', '', '0', '', '$2a$10$l9Rz25U2UBRAP8aGOOSvyuT/cms5aZe5Dx0C47nUj9XPODs.1DwAu', 20, 864.94, 800.00, '1', '', '', '2305261126226597721', 'ZLEIOYM4BZCQWIIQR7FT7DEM5QZACOPEOYDAHG7TCVG66385EGF1ZPLUK48VM09J0E1RCPJMFXPMBEHNOWGT0O3ADLPGY5OKWWATMWM4H9AHOJVTAEWU1GKQLBE788YD', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-26 11:26:23', '', '2023-06-05 09:47:53', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('a5ea79c5f61b441ab5fc1b134f9bb391', '车厘子', '车厘子', '', '', '0', '', '$2a$10$ETvQUKXLC/dmF4dXHKmOb.bL6ZRqWrDe67X6KwqDdZ4b6mKCby/Ky', 20, 127.20, 120.00, '1', '', '', '2306071511080294153', '1LFKA3S9T6REZVFUOLBDHBSGQCEMFITGQSAUCGXHMQ1YLKVLKWMXRBBRUKCM22YSYZQHKKEGDH7QMANSXV3LTLGFCSWV7XDLXC5UQU0RKDJ7FFJICKVBQKCG2JZOCYGQ', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-07 15:11:08', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('a6491d007b624f8e8a17e178b3f1d48b', '旺仔小馒头', '旺仔小馒头', '', '', '0', '', '$2a$10$M/Sk4jR8VliS4t5MaOAN7ejnTgk9sLNfBKN.2/7qObhdz7XGIb1ga', 20, 2656.54, 0.00, '1', '', '', '', '', '', '0', '0', '0', '', null, 1, 'admin', '2022-04-14 17:18:54', 'admin', '2023-06-06 19:28:46', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('ab264227be0a42eba021a061a9fe9603', '小王', '小王', '', '', '0', '', '$2a$10$Z1k29xfFICjRzHmnScd6vedoLflf/pigXnLYDVkAlDKw43E10Vcfa', 1, 4.90, 0.00, '1', '', '', '2208132142147655124', 'BBVPVJTTEN2MHZOPMZPVMUNGSRZU9Z4YFKPB2RCZDDRDQUBLQG4T6CYNDMIH7DQFVWOM5D6LLBI7XVJKZXXGH7MPBQTI2U8GEGE4KR6EKJXLT5EVUITH1OBSAYEO9PKN', '', '0', '1', '0', '', null, 1, 'admin', '2022-08-13 21:42:15', 'admin', '2023-06-07 18:10:56', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('ae54b720e28c440084d8ec067ea4a7d8', '浩泽', '浩泽', '', '', '0', '', '$2a$10$DrEpTlNlDS8j3nDsu1l1D.bS/nQT3M87JocdnYskDE77jEZSOk9NK', 20, 574.40, 500.00, '1', '', '', '2305011448416746162', 'GVHMEJFFGSYNQEXLPRVJ5COKXUUPPUJUZSRNRSY764KXQ97FV9UTODKTUEGIOQQN5OB8F52GPIVZLRRBUNKPLZWFQS7C6XMGOE8ZCFSHAIV1ZGGEBMAJMDRN0UNOUURF', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-01 14:48:42', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('afa63236aaf34f07860970eea913210e', '王飞跃', '王飞跃', '', '', '0', '', '$2a$10$A0BW7cKcejJKIzCqYuNHL.2i8ZZUT8PT7mY2Lv0niIBvY4xAQYYZ6', 20, 332.10, 300.00, '1', '', '', '2305291222075930108', '3DISWZRLUQE52SC4JPIHL5O7GNG9SWDJK5XPFBBD5ERBWVSD07WCUYNGZOKXMQWZRZMOALIV1CNFZCMV6QC0WO85Q6JIORK5QVKGXYPGBAOVJZUUKJRQEIPXYPEKDEPH', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-29 12:22:08', 'admin', '2023-06-01 20:09:45', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('b12aa76495524b17ba9d97b129146e8a', '王晨飞', '王晨飞', '', '', '0', '', '$2a$10$TFRkiiDiWGU21MaVwoRn9OwNRzp7zz68pZ.qXu/FgoISKHviMUf2q', 20, 287.69, 0.00, '1', '', '', '2304291324132133812', '2NUZWNYNJSRF9IE1OD7T4NTJGAVD9MVYPRQJPCMURJQBUYUK4JMMMWETZIRZBAQXOWJWDI66UVI03B93ULQGPMBQZTYJHBTA82LGPD4JD8YBLBSLVVXSJLM1JYHFEZLA', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-29 13:24:13', 'admin', '2023-06-10 10:32:53', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('b1c983b5cb324a35af833583caea6341', '文人青', '文人青', '', '', '0', '', '$2a$10$t978wLyYmbXmLHnzXQkdNu5s9YFiuOZWgEWOEuPaR1euOWbjqTwEa', 1, 0.00, 0.00, '1', '', '', '2210261444392105115', '3ZCIA0VJXHNVLZFQKGMJBIN39FVLBGHFRWQJC8TS0G2WWOR2VKNQLOZRO1YDQXN7RTVYLKTBFEJKS8Q5EQT4L9TCGTRS5BWQVI9ANSGWLVWCO2DSPKNUDLRQWQJJLGTR', '', '0', '1', '0', '', null, 1, 'admin', '2022-10-26 14:44:39', 'admin', '2023-06-07 18:12:48', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('b21958ec433746558063dc9dace9bae2', '刘晓江', '刘晓江', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/04/05/a6c027f0-0c3a-4488-a441-d64661bd11c6.jpeg', '$2a$10$OOXz.Xp7CVvk9EWaZaJfAudTLZYxaieGlC/3dQ2Xte1ZHzkTN2QSe', 20, 150.80, 0.00, '1', '', '', '2304011610482636056', 'EPNV9TGAZNGB1Z2LBXOFVYHKPV0KO5ZY0OTVWRTPA5HRVYVTWU2R8HUU11URQPETGZLHDYHRU0RGVLRVNZ8FCRUGW0INWGIUAETJTXND0WTXK8K4KZRKQVUJX53CKII0', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-01 16:10:48', '', '2023-04-05 20:22:30', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('b6ea5bd469e449fcae859a678bf25115', '周予安', '周予安', '', '', '0', '', '$2a$10$QSif1e4PFyQo9yUIEqzn2u9IuN49Zsrg80dooEOV1K786Y3yZkJ1G', 1, 48.88, 0.00, '1', '', '', '2212071346156994768', 'Z2H83X73R1NIHLEVYBDOYAWW9PJRVJDM9PWH65RC2OREDXFFWRQK2OCIPP1LVAIE7BSQKEOOSQZJLIGZPAKVZL41JYNT2K7RJDA6QKQIUGFEOOLK5KNVNK6LNDUWVDAB', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-07 13:46:16', 'admin', '2023-04-02 18:27:57', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('bcc78d6063ed4b418d437da584338eb5', '陈刚', '陈刚', '', '', '0', '', '$2a$10$x.enPYQlDXXt1iQxK1yyreV3lltFPdVPWyTxUNvSrlxDRVE1eOG2C', 20, 243.99, 0.00, '1', '', '', '2305041426462810516', 'JR2SMOXPJCHPXDHVJFHUVCNAMAPMISWFOK4U9JZE0M2ASQCLV4UP6QOJ03Z1RVTSQJXK4ORIKPIJ4FF669R3ITPE95DSQHD9TJDHZ8EQ9PN3KPAJNFLO9DSZ54WJCS9K', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-04 14:26:46', 'admin', '2023-05-04 14:55:51', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c0d4ed9222494b6bb18096a0118668a6', '果冻', '果冻', '', '', '0', '', '$2a$10$3C1cEqWdWAXKAk7o/fquP.GOUBgdwdadj1CWNTr2QC979fEzArSAK', 20, 657.14, 0.00, '1', '', '', '2304221457321575647', 'KQCDJSCNCGQ358U6PMOP6SOHHTV5PAWJOTYX4FQFWY0KXHSYJUQUCRBPQRHEL6X7PATHM5QML7LRPYVTSUWU9FQBIYZLXEAY4WLAJTLQTFAWX4JXEDHHJ8SGMCEJAXMA', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-22 14:57:32', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c243f42d51ac4ed9b91e4da4acc088f9', '刘春平', '刘春平', '', '', '0', '', '$2a$10$2gZymwAajYAz.1aZOaacB.wEu82e9NZ1.dQP1tLFJ/1fQKCYE2dFa', 1, 0.00, 0.00, '1', '', '', '2303051441130658854', 'NMFWX0MZY3N9XPN5CPCXNJJ7UTALD5JWKYDJ9HI5NBGMTRLBIUBSMPFCRDOTZIJMGCZVZCEIDXVFBDZKWXG2PHETDDLQ3JLM8CISTRTHJJ6FHH3LUVNRZBBT8XZW0CJJ', '', '0', '1', '0', '', null, 1, 'admin', '2023-03-05 14:41:13', 'admin', '2023-05-02 18:23:26', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c42d58a3a87e44039fccc5408b3953a2', '圆梦', '圆梦', '', '', '0', '', '$2a$10$UBh4ELcn5b8FWljTxvksuePMECRNw4yuwtCQb8jIXINbrF.jgK.Uq', 1, 108.00, 0.00, '1', '', '', '2212281513251286504', '57JXGHUAZ4PHN5MWM47CPG8AJBCRT6I98H2LQFUNSW3RH84JXMPDU2RJTERNVOFYGF0INK8UAHCW77O9SL6CLXLWRGFHKFY7NIHCMOFRXUL3GYQZ8ZKRPUJC2UDX043E', '', '0', '1', '0', '', null, 1, 'admin', '2022-12-28 15:13:25', 'admin', '2023-06-07 18:16:16', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c7c517d054fe4d7187efad481531463d', '张洋', '张洋', '', '', '0', '', '$2a$10$qGmj.705fp/u24WB1koFYOOM4TK8G6qO0boeOgQx8aS4TU2vkvzES', 20, 900.70, 0.00, '1', '', '', '2305121352185773755', 'CCFGOEIM4MTYDPS6CO1RKEICCGVYQVU3M1ITPLOZW41KIFWW3YPUAZEZ5EWA49S4USUIYSLXLNVVG8AMZTSDN84Q1TWBNKPJMOBNWL6PZCWRJKUDFZF6KRSVSO1YK4QQ', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-12 13:52:19', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c8464cbbb42444a4943db0fa3fc01e5e', '翟鑫源', '翟鑫源', '', '', '0', 'http://daili.ygcm666.com/profile/avatar/2023/03/09/f2992fa8-aca4-423e-b9cf-29a0a40576ac.jpeg', '$2a$10$IeNfAAzzFD.aLlT/2lOKA.Yh4OWH5m1U3hgUGWj6XNSlGlCFcdeiq', 20, 1342.64, 0.00, '1', '', '', '2302101424229528929', 'HVPWMHINEG1GWI8SYP9QDSBGLCB0ONBNIRECFLOUVGYZKGOTSB1ITV0D4WJCT4AJ017BYMFGKAE2TWUETTLZG4CXRZJAG9ISNME0MJWYLPYKEWNG82UO9USPCBOBOAK8', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-10 14:24:23', '', '2023-03-09 11:23:24', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c9bb5a3c98da4c90bfa0fc3b644294a0', '阿强', '阿强', '', '', '0', '', '$2a$10$z05xqEvzoz3ai.wk8M95tekU6Mm.zBHETj9H4GAkH1GriRysGv7sW', 20, 652.40, 600.00, '1', '', '', '2305042007454922030', 'LFWNAYENGNRI3SHBDQBXY3FZ2I2ABYBFIRAECYK245JBMGITXAHLT2MEFNPT2TWFJMFOIPE9FWY0FORFPNNXDDYSULKSN5DRGQN3LG0JQGUWMQIJMYCGMDMBHDPB9XR3', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-04 20:07:45', 'admin', '2023-05-04 21:06:09', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('c9bcce0017f04f8aac9f2517983ebce1', '小白瘦十斤', '小白瘦十斤', '', '', '0', '', '$2a$10$ELozzAo7XWUwgwKAnvmQce9ZZQNzJsR1QIERB2Dtgaq9msXozrKMK', 20, 3.40, 0.00, '1', '', '', '2305231717524584854', 'JE5UAXG0IOSK7GYEVZH1J0DAJHPOE1KIWITRZDAXZKV5DHQQIZX4FBTRTQTU00YJGP4CYV119NFTHCR7MYGCQYJPVUKNRGRYYAZTICCY9QA3QCTZOOSHFOX3FN1H1DQ3', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-23 17:17:52', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('cb2cd1b6e8574245a54a09198de7c43d', '杨杨得亿', '杨杨得亿', '', '', '0', '', '$2a$10$sMTgTkntjuzIs9cQzJXmH.7hWVQufxFSC0xQVpdfHzMlWGqmx1CdW', 20, 132.84, 0.00, '1', '', '', '2210011314065698566', 'HR2VLSAPGVFWU0LJHLJJCVFQTXE7MLCBADVFO6HZHD49BEWGZARMNJVE80SSUIWYBWZTJF0P9VPKBE4BRLCDZJOUDPNXGYANA8OMVOLSVIKNGLUOFR81HDG00AFD1E50', '', '0', '0', '0', '', null, 1, 'admin', '2022-10-01 13:14:07', 'admin', '2023-01-13 15:16:11', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('cb74f992fcd545c6b514debc748070f3', '崽崽', '崽崽', '', '', '0', '', '$2a$10$hfY9tu1I4U8stHrJXJ81HOXihcJI7pJAiemDVbsOylzTNFkDRd2.K', 20, 271.64, 0.00, '1', '', '', '2305101332231205671', 'GBA5KQJ88PJGXT5EVZO0HW48N5UP9BAZN2Q6PS9FQTHPFFS2UFBPYUR8T9UXWBWU4M4R5HKF9CENO2ZUIUTJUHNNCLQGPOBY4V9SSN4HFW63B9I43RCVVOYDLEBRU0GB', '', '0', '0', '0', '', null, 1, 'admin', '2023-05-10 13:32:23', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('cbcdb73c2ddf49adb5a0a8e354d0945f', '毅起', '毅起', '', '', '0', '', '$2a$10$nyitjOtjb9fu0XwvSc6EFe0xY3/QqZFBiC1/624DylqnL7JzHSdnS', 20, 42.80, 0.00, '1', '', '', '2306050759346516678', 'VTADNOHUCE4MQUX4PHQA2XE53BQAJLGMUKIYROZPARU3DU8DCHZKRRJOHD0TZNSSEKJNDGH4QSRDDZSWEHZVGHZLGIUFXLKRQQLHS49KWAZRPIJUGBDPOATBP7DYOFVS', '', '0', '0', '0', '', null, 1, 'admin', '2023-06-05 07:59:35', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('ccac4d6cf496426fa6f87de26ac73f15', '豆苗', '豆苗', '', '', '0', '', '$2a$10$r/5z7qQ.x4GzjO2Izr.FcOij5GYjzhK0sUwcD9lGuyjbXCDVzJc2S', 1, 168.73, 0.00, '1', '', '', '2206201049230040081', 'Q7V6EXNZ1AR66M9QVGMRVPVFUA9DERMT7ICRC0PMEL9OKJ2KE2HUGVUGJBLVMFPGT5DTQG7XZAATS4MLIFBGJIL4J8BGPXYVUR4RDUHHEDTHXCG55JZMJZAUG1BIS9E7', '', '0', '1', '0', '', null, 11, '审核', '2022-06-20 10:49:23', 'admin', '2023-04-02 17:59:15', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('d7a37cd959354d3fbc36ac0d71cf9192', '学武', '学武', '', '', '0', '', '$2a$10$FyL7HGitdsNzCHcxVPjTQO7jANW08sdIwc1v1csd3u01d.qj.LO8O', 20, 597.25, 0.00, '1', '', '', '2207121044588107070', '3QGKLECPAWVOCJQNQOEYLKDNYCPDF9KJMIDVR1YRV67I6CEARQPC97LPXMPJWBAV1LDVICHBJ0XJHXK86Q9OGHXVFYJIP3FNLD7ILTEYNNZS1NF7FJX3VTSDMOYUAHPC', '', '0', '0', '0', '', null, 1, 'admin', '2022-07-12 10:44:59', 'admin', '2023-04-26 12:14:30', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('e2ff378a2fec45b59a78c95ff7d83e3d', '恒丰4', '恒丰4', '', '', '0', '', '$2a$10$c6IQmkVRRqCaieoMB9YtlesvdZEIdxhNa5F5sYIclc8u7awDOLcJC', 20, 0.32, 0.00, '1', '百分之20', '', '2207141545572457012', 'HEJMVFMD4SDTFALZJJPIXPBJ5JQCCM8R8KG3ITRLBS401YJHT3XQN8ISV7CQ0NFNWBTW8ULFZ4Q1TASWWVUFCWGWIVSE1AWGZDPLKN4JL87IYEWN3IOYLRJQCSOG43YE', '', '0', '0', '0', '', null, 1, 'admin', '2022-07-14 15:45:57', 'admin', '2023-02-16 12:00:57', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('e36b434713e74146932e3d772323d00e', '张派', '张派', '', '', '0', '', '$2a$10$mT02vYDLrelc7q0T5Q7XZOG1u.TI0cNEj.ok1bpJ27b0BDC4YBjEm', 20, 544.60, 540.00, '1', '', '', '2212151909460323230', 'O8L1INE3ACBEM2X9P0UJCY2X1MJKYH0QOMCTY1BOO6YCYJUSEQO3RYRIUXQTBDHSHWULHNF4NPGIHYWLIH4ZTUBV2HYNEDLCOZ77KGCIAZXGRR2Y7LVVQMIJXWP8GPAF', '', '0', '0', '0', '', null, 1, 'admin', '2022-12-15 19:09:46', 'admin', '2023-03-04 12:00:10', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('e5f7093a78d345b2a684b092052ed7da', '铁山靠', '铁山靠', '', '', '0', '', '$2a$10$m1z0NZsLwTA1kmaNZ1R0xOavYm8PrQnE.UxPCkwezXHlWJ3mwPeBq', 20, 435.59, 0.00, '1', '', '', '2302172136462280549', 'TT0VFLWRVAZR4LCCDFISCLCVQTQED4X2X8LGPZSHNEORKFOOXPXDDECD9VHOYEQ8ZLUSHAXMYSHXCMSMDV4TBPDYMNNDS5O2EIKHMGDLLW3K0BEDJXQPAQULQDHIYSWF', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-17 21:36:46', 'admin', '2023-06-08 10:05:56', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('e6332f0f4854406f9213e5b2c9aba6a2', '张张', '张张', '', '', '0', '', '$2a$10$gbd2MQsT7DBhsTgMeT6Ya.Ifld0DUb72ur.paV8oDU041spYIuw9e', 1, 1.50, 0.00, '1', '', '', '2211212058493785508', 'G9AUDTN2QIXZQQDXAU8NHJYSA04IDJF1GHPSIQNEAVE4IXHPP52XJYE1KFRHDZYO7PXIPTERKSOIFHOKMYNPNVKF1H1VDVSMRCVDIJBQ1NSVZH1DUHVU3DVNBOEIAURG', '', '0', '1', '0', '', null, 11, '审核', '2022-11-21 20:58:49', 'admin', '2023-01-02 16:04:03', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('e78f01e33f00468f9b468cd6c1905acc', '浪淘沙', '浪淘沙', '', '', '0', '', '$2a$10$wLvN3nTO7wjjYUpoYHh2xu5V/CoaBFDqApeo1fOTXE4U40VEUkvtG', 20, 52.81, 0.00, '1', '', '', '2304062039327492705', 'LREGMRTUUGV4QVIXRPKZAW4LMFNWNGKUCGXNKYTIUP7OISW7YAT6Q3PC3RIYXNRLNGTYSLE5TMJ9IJU6JOJKQCZKP6PSLKU8MVHEQ1RC4CADBMLJFBHMIK77OLKZTA7A', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-06 20:39:33', 'admin', '2023-05-06 11:16:38', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('eb6624afa43d4388bb0148cabfc38726', '周杰', '周杰', '', '', '0', '', '$2a$10$rGClno/qsWs.gLdxwaLpi.hsCQL5dt.ik0VF2XHFKfwhgT12JvnbO', 20, 189.56, 0.00, '1', '', '', '2304021432319128842', 'ANF2FZRAQ1OACX70RW62TLMMBW9S1BOAGGHKSGQ7QAR3FBYKM5HJIOQTQJ72E8J7X1XEOKYHHG2Q1PD3X5MSWNPPBLE9KGC88JFZ9HHFWGKZ6LZMLDPUQUAQCNNYVASF', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-02 14:32:32', 'admin', '2023-06-01 22:33:22', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('ec0090c957504d47a991bf7f25187fc2', '鑫鑫', '鑫鑫', '', '', '0', '', '$2a$10$BOB7Olno2em9rrFBDJ7KDuudnR0Td3oSwgRpFDvRsbC2bEEgWbZXe', 20, 719.50, 700.00, '1', '', '', '2304131554586195165', 'YO3UUKE4CHHZ9ACZCNPG9AS3PHCZ0ZGRNB6IG2MQKUHOONZR9W1PXNJT4YGROO1RUSGWFDWY7BR9KIBCAILRFJSPHMHI37E6NFYMVEQOWWFRGSOYOBEKKC4SYFNTPPNL', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-13 15:54:59', '', null, null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('ecc767172fc540aaa972a228ade871f8', '张淑君', '张淑君', '', '', '0', '', '$2a$10$k.4Uv2AQc6r7/8GGllGPcuPC6u9/XJ80oTtc6qFaomZHodXWF9sA2', 20, 697.52, 0.00, '1', '', '', '2303221350512184499', '0Z40ATCOQEG3PYL0JNUQIJVHHWDNYPDZJVLAP5HVMSSJSQJWQXAIFSEJQB5C69067BQDDFU66CICHVUXLCM9YJWHDSPQSGTRKZOLXBQ4RZ0QNDQRRDE4RYXMBXPKHLJQ', '', '0', '0', '0', '', null, 1, 'admin', '2023-03-22 13:50:51', 'admin', '2023-06-08 10:06:24', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('eddf429b96004bf98f15277b9f665a9b', '米奇妙妙屋', '米奇妙妙屋', '', '', '0', '', '$2a$10$r8NPstjBSUqRcEcI0T6pe.ykBXltTZXVnGcbmiRLaOCdC9X/u2gWC', 20, 483.40, 0.00, '1', '', '', '2209301738003696495', '7HBBJDLCORPBH4UVICFHBOB2MHWND8VDI94BPEF8WUGGRST5ICHWP6TLTVCIMECB9TDMAHPPG4LU9P0VZYEFWLNDC6XRIBACEGAJ3LLTRJDCULJZLCODP9XO9YYFUCNE', '', '0', '0', '0', '', null, 1, 'admin', '2022-09-30 17:38:00', 'admin', '2023-04-04 17:01:31', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('f1944649a3f64cd8930e26e7cba62e95', '关山城', '关山城', '', '', '0', '', '$2a$10$u0AeWXJlKzmEwIUIQdlhDORMD8RY6GmZNuo0yhaOnVCUPF7kUuxy2', 1, 0.80, 0.00, '1', '', '', '2207032053583921871', 'U5LAWD7T5GD5MSENKBKPQCYVKXLYUCLCWUTPYXT0JB5A2CCWYCPNTEECW74VM7YRO5JYJVV0DQX5OBS8XFDUHYNN092W3G6FWN0O7GENSY7ICK1ZQXOGQAJTP9BVAQ8U', '', '0', '1', '0', '', null, 1, 'admin', '2022-07-03 20:53:58', 'admin', '2023-06-03 17:27:25', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('f19c1594922c42a09685ee2986f3eb80', '高一星1号', '高一星1号', '', '', '0', '', '$2a$10$YZGbljyARytqDFB4jZgRYuJewCBfsayjR5lq5wm7qGbBzU0QKrLLu', 20, 1216.52, 0.00, '1', '', '', '2302101840098379601', 'Z0LT3GTZLJMATIOSZZULKVPAHIK1T5YAZH2JS16ZME7BTQFTH1KMHRP2GWVCLBBY90NEV93YQMQRONP15SYTO1LBDQYAHJFHBFV8FZ79O7BMEUQW1YP0OWVH9KOHBJ4A', '', '0', '0', '0', '', null, 1, 'admin', '2023-02-10 18:40:10', 'admin', '2023-04-13 13:06:37', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('f1f47c22986845fd9bb9fcf31aa7e8fd', '小糯米', '小糯米', '', '', '0', '', '$2a$10$o4rYMfEjrvYt7126fRNbse/U8LM5Zht0gTOPpu.RgSAXWXuPBT8Ry', 20, 208.21, 0.00, '1', '', '', '2208062221426993040', 'Y8KVWZ2TX01JIECVPLOPK7AOAKJ7JXIEZP7XUD9PFTT92HAQ7IZLKVM7Z2E9HAAB800VCCQAWKUJLUXBVLZSNBREPQRDADNK31WLSYNXH0N3YLW8ATLWPEPALOJA25AP', '', '0', '0', '0', '', null, 1, 'admin', '2022-08-06 22:21:43', 'admin', '2023-02-10 15:09:32', null);
INSERT INTO `tianyin_admin`.tianyin_agent (agent_id, login_name, nick_name, phone_number, email, sex, avatar, password, machine_num, amount, froze_amount, new_old, alipay_name, alipay_account, app_id, private_key, notify_url, order_attribute, status, del_flag, login_ip, login_date, create_by_id, create_by_acount, create_time, update_by, update_time, remark) VALUES ('f9ce70681c7a47d28e11d95097a63caf', '六六', '六六', '', '', '0', '', '$2a$10$VUjul8l0FX3fP9W4ZOX3S.lK2juOmFEZ82eIRuFL1DD4p/oUlCys6', 20, 154.96, 0.00, '1', '', '', '2304231204330710381', 'RYXCM2UADCT8QMKRRUEYZXJAQVYRIRL8BGVB7BL4NYLEFWFYXBL4TZHQSQFSZ00SRZB5XCZRUF0ELXTV4I3SVJBLW2QISNT2A3TBFSYSEYNRRNV6HR0CGECSWLS00VHI', '', '0', '0', '0', '', null, 1, 'admin', '2023-04-23 12:04:33', '', '2023-04-29 21:15:02', null);




INSERT INTO `tianyin_admin`.sys_user_role (user_id, role_id) VALUES (1, 1);


INSERT INTO `tianyin_admin`.sys_user_post (user_id, post_id) VALUES (1, 1);





INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 107);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1036);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1037);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1038);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1039);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1061);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1062);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1063);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1064);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1065);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1066);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1067);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1068);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1069);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1070);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1071);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1072);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1073);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1074);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1075);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1076);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1077);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1078);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1079);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1080);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1081);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1082);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1083);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1084);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1085);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1086);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1087);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1088);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1089);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1090);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1091);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1092);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1093);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1094);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1095);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1096);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1097);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1098);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1099);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1100);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1101);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1102);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1103);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1104);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1105);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1106);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1107);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1108);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1109);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1111);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1112);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1113);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1114);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1115);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1116);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1117);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1118);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1119);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1120);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1121);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1122);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1123);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1124);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1125);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1126);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1127);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1128);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1129);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1130);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1131);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1138);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1139);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1140);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1141);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1142);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1143);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1150);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (3, 1151);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1130);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1138);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1139);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1140);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1141);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1142);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (4, 1143);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1098);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1099);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1100);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1101);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1102);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1103);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1104);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1105);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1106);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1107);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1108);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1109);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (5, 1130);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 2);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 3);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 100);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 101);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 102);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 103);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 104);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 105);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 106);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 107);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 108);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 109);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 110);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 111);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 112);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 113);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 114);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 115);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 116);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 500);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 501);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1001);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1002);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1003);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1004);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1005);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1006);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1007);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1008);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1009);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1010);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1011);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1012);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1013);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1014);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1015);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1016);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1017);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1018);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1019);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1020);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1021);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1022);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1023);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1024);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1025);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1026);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1027);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1028);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1029);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1030);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1031);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1032);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1033);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1034);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1035);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1036);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1037);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1038);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1039);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1040);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1041);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1042);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1043);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1044);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1045);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1046);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1047);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1048);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1049);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1050);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1051);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1052);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1053);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1054);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1055);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1056);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1057);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1058);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1059);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1060);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1061);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1062);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1063);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1064);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1065);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1066);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1067);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1068);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1069);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1070);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1071);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1072);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1073);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1074);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1075);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1076);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1077);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1078);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1079);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1080);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1081);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1082);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1083);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1084);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1085);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1086);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1087);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1088);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1089);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1090);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1091);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1092);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1093);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1094);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1095);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1096);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1097);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1098);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1099);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1100);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1101);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1102);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1103);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1104);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1105);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1106);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1107);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1108);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1109);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1111);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1112);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1113);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1114);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1115);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1116);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1117);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1118);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1119);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1120);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1121);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1122);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1123);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1124);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1125);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1126);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1127);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1128);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1129);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1130);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1131);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1132);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1133);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1134);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1135);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1136);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1137);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1138);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1139);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1140);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1141);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1142);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1143);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1144);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1145);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1146);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1147);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1148);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1149);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1150);
INSERT INTO `tianyin_admin`.sys_role_menu (role_id, menu_id) VALUES (6, 1151);


INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-06-21 19:55:21', '', null, '超级管理员');
INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (2, '普通角色', 'common', 2, '1', 1, 1, '0', '2', 'admin', '2021-06-21 19:55:21', 'admin', '2021-07-13 11:46:25', '普通角色');
INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (3, '员工角色', 'yuangong', 3, '1', 1, 1, '0', '0', 'admin', '2021-07-17 02:47:48', 'admin', '2022-04-20 01:52:12', null);
INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (4, '补单审核', '补单', 0, '1', 1, 1, '0', '0', 'admin', '2022-01-20 02:55:44', '', null, null);
INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (5, '财务', '财务', 4, '1', 1, 1, '0', '0', 'admin', '2022-04-18 22:46:50', '', null, null);
INSERT INTO `tianyin_admin`.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (6, '审核', '审核', 5, '1', 1, 1, '0', '0', 'admin', '2022-04-20 02:15:11', 'admin', '2022-04-22 14:54:03', null);


INSERT INTO `tianyin_admin`.sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, update_by, update_time, remark) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, update_by, update_time, remark) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, update_by, update_time, remark) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, update_by, update_time, remark) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-06-21 19:55:21', '', null, '');




INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1, '系统管理', 0, 8, 'system', null, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-06-21 19:55:21', 'admin', '2021-06-23 09:41:26', '系统管理目录');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2, '系统监控', 0, 9, 'monitor', null, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-05 15:44:46', '系统监控目录');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统工具', 0, 10, 'tool', null, 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-04 18:02:38', '系统工具目录');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-06-21 19:55:21', '', null, '用户管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-06-21 19:55:21', '', null, '角色管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-06-21 19:55:21', '', null, '菜单管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-06-21 19:55:21', '', null, '部门管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-06-21 19:55:21', '', null, '岗位管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-06-21 19:55:21', '', null, '字典管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-06-21 19:55:21', '', null, '参数设置菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (107, '代理通知', 0, 1, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-07 01:11:57', '通知公告菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-06-21 19:55:21', '', null, '日志管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-06-21 19:55:21', '', null, '在线用户菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-16 20:50:09', '定时任务菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-06-21 19:55:21', 'admin', '2022-02-08 22:32:59', '数据监控菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-06-21 19:55:21', 'admin', '2022-02-08 22:33:02', '服务监控菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-06-21 19:55:21', 'admin', '2022-02-08 22:33:06', '缓存监控菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '1', '0', 'tool:build:list', 'build', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-04 18:02:14', '表单构建菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '1', '0', 'tool:gen:list', 'code', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-04 18:02:11', '代码生成菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-04 18:03:38', '系统接口菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-06-21 19:55:21', '', null, '操作日志菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-06-21 19:55:21', '', null, '登录日志菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-06-21 19:55:21', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1061, '代理账号', 1130, 1, 'agent', 'agent/agent/index', 1, 0, 'C', '0', '0', 'agent:agent:list', 'peoples', 'admin', '2021-06-23 09:42:35', 'admin', '2021-08-09 15:04:14', '代理信息菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1062, '代理信息查询', 1061, 1, '#', '', 1, 0, 'F', '0', '0', 'agent:agent:query', '#', 'admin', '2021-06-23 09:42:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1063, '代理信息新增', 1061, 2, '#', '', 1, 0, 'F', '0', '0', 'agent:agent:add', '#', 'admin', '2021-06-23 09:42:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1064, '代理信息修改', 1061, 3, '#', '', 1, 0, 'F', '0', '0', 'agent:agent:edit', '#', 'admin', '2021-06-23 09:42:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1065, '代理信息删除', 1061, 4, '#', '', 1, 0, 'F', '0', '0', 'agent:agent:remove', '#', 'admin', '2021-06-23 09:42:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1066, '代理信息导出', 1061, 5, '#', '', 1, 0, 'F', '0', '0', 'agent:agent:export', '#', 'admin', '2021-06-23 09:42:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1067, '代理密码重置', 1061, 6, '', null, 1, 0, 'F', '0', '0', 'agent:agent:resetPwd', '#', 'admin', '2021-06-23 13:13:25', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1068, '会员账号', 1129, 1, 'member', 'member/member/index', 1, 0, 'C', '0', '0', 'member:member:list', 'user', 'admin', '2021-06-23 15:22:47', 'admin', '2021-08-08 16:19:58', '会员信息菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1069, '会员信息查询', 1068, 1, '#', '', 1, 0, 'F', '0', '0', 'member:member:query', '#', 'admin', '2021-06-23 15:22:47', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1070, '会员信息新增', 1068, 2, '#', '', 1, 0, 'F', '0', '0', 'member:member:add', '#', 'admin', '2021-06-23 15:22:47', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1071, '会员信息修改', 1068, 3, '#', '', 1, 0, 'F', '0', '0', 'member:member:edit', '#', 'admin', '2021-06-23 15:22:47', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1072, '会员信息删除', 1068, 4, '#', '', 1, 0, 'F', '0', '0', 'member:member:remove', '#', 'admin', '2021-06-23 15:22:47', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1073, '会员信息导出', 1068, 5, '#', '', 1, 0, 'F', '0', '0', 'member:member:export', '#', 'admin', '2021-06-23 15:22:47', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1074, '首页轮播', 0, 1, 'noticepage', 'focus/notice/index', 1, 0, 'C', '1', '0', 'focus:notice:list', 'link', 'admin', '2021-06-23 16:17:13', 'admin', '2021-12-25 12:34:51', '焦点图管理菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1075, '焦点图管理查询', 1074, 1, '#', '', 1, 0, 'F', '0', '0', 'focus:notice:query', '#', 'admin', '2021-06-23 16:17:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1076, '焦点图管理新增', 1074, 2, '#', '', 1, 0, 'F', '0', '0', 'focus:notice:add', '#', 'admin', '2021-06-23 16:17:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1077, '焦点图管理修改', 1074, 3, '#', '', 1, 0, 'F', '0', '0', 'focus:notice:edit', '#', 'admin', '2021-06-23 16:17:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1078, '焦点图管理删除', 1074, 4, '#', '', 1, 0, 'F', '0', '0', 'focus:notice:remove', '#', 'admin', '2021-06-23 16:17:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1079, '焦点图管理导出', 1074, 5, '#', '', 1, 0, 'F', '0', '0', 'focus:notice:export', '#', 'admin', '2021-06-23 16:17:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1080, '商品管理', 0, 4, 'goods', 'goods/goods/index', 1, 0, 'C', '0', '0', 'goods:goods:list', 'international', 'admin', '2021-06-25 10:28:18', 'admin', '2021-06-25 10:29:41', '商品菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1081, '商品查询', 1080, 1, '#', '', 1, 0, 'F', '0', '0', 'goods:goods:query', '#', 'admin', '2021-06-25 10:28:18', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1082, '商品新增', 1080, 2, '#', '', 1, 0, 'F', '0', '0', 'goods:goods:add', '#', 'admin', '2021-06-25 10:28:18', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1083, '商品修改', 1080, 3, '#', '', 1, 0, 'F', '0', '0', 'goods:goods:edit', '#', 'admin', '2021-06-25 10:28:18', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1084, '商品删除', 1080, 4, '#', '', 1, 0, 'F', '0', '0', 'goods:goods:remove', '#', 'admin', '2021-06-25 10:28:18', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1085, '商品导出', 1080, 5, '#', '', 1, 0, 'F', '0', '0', 'goods:goods:export', '#', 'admin', '2021-06-25 10:28:18', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1086, '商家订单', 0, 5, 'orders', 'member/orders/index', 1, 0, 'C', '0', '0', 'member:orders:list', 'shopping', 'admin', '2021-06-25 13:22:15', 'admin', '2022-01-14 18:18:05', '订单信息菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1087, '订单信息查询', 1086, 1, '#', '', 1, 0, 'F', '0', '0', 'member:orders:query', '#', 'admin', '2021-06-25 13:22:15', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1088, '订单信息新增', 1086, 2, '#', '', 1, 0, 'F', '0', '0', 'member:orders:add', '#', 'admin', '2021-06-25 13:22:15', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1089, '订单信息修改', 1086, 3, '#', '', 1, 0, 'F', '0', '0', 'member:orders:edit', '#', 'admin', '2021-06-25 13:22:15', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1090, '订单信息删除', 1086, 4, '#', '', 1, 0, 'F', '0', '0', 'member:orders:remove', '#', 'admin', '2021-06-25 13:22:15', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1091, '订单信息导出', 1086, 5, '#', '', 1, 0, 'F', '0', '0', 'member:orders:export', '#', 'admin', '2021-06-25 13:22:15', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1092, '已抢订单', 0, 6, 'agentOrders', 'agent/orders/index', 1, 0, 'C', '0', '0', 'agent:orders:list', 'tree', 'admin', '2021-06-25 22:36:11', 'admin', '2022-01-14 17:46:00', '订单分配菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1093, '订单分配查询', 1092, 1, '#', '', 1, 0, 'F', '0', '0', 'agent:orders:query', '#', 'admin', '2021-06-25 22:36:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1094, '订单分配新增', 1092, 2, '#', '', 1, 0, 'F', '0', '0', 'agent:orders:add', '#', 'admin', '2021-06-25 22:36:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1095, '订单分配修改', 1092, 3, '#', '', 1, 0, 'F', '0', '0', 'agent:orders:edit', '#', 'admin', '2021-06-25 22:36:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1096, '订单分配删除', 1092, 4, '#', '', 1, 0, 'F', '0', '0', 'agent:orders:remove', '#', 'admin', '2021-06-25 22:36:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1097, '订单分配导出', 1092, 5, '#', '', 1, 0, 'F', '0', '0', 'agent:orders:export', '#', 'admin', '2021-06-25 22:36:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1098, '资金流水', 1130, 2, 'history', 'agent/history/index', 1, 0, 'C', '0', '0', 'agent:history:list', 'druid', 'admin', '2021-07-20 02:01:35', 'admin', '2021-08-09 15:04:40', '代理流水记录菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1099, '代理流水记录查询', 1098, 1, '#', '', 1, 0, 'F', '0', '0', 'agent:history:query', '#', 'admin', '2021-07-20 02:01:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1100, '代理流水记录新增', 1098, 2, '#', '', 1, 0, 'F', '0', '0', 'agent:history:add', '#', 'admin', '2021-07-20 02:01:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1101, '代理流水记录修改', 1098, 3, '#', '', 1, 0, 'F', '0', '0', 'agent:history:edit', '#', 'admin', '2021-07-20 02:01:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1102, '代理流水记录删除', 1098, 4, '#', '', 1, 0, 'F', '0', '0', 'agent:history:remove', '#', 'admin', '2021-07-20 02:01:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1103, '代理流水记录导出', 1098, 5, '#', '', 1, 0, 'F', '0', '0', 'agent:history:export', '#', 'admin', '2021-07-20 02:01:35', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1104, '结算管理', 1130, 3, 'record', 'agent/record/index', 1, 0, 'C', '0', '0', 'agent:record:list', 'documentation', 'admin', '2021-07-20 18:25:28', 'admin', '2021-08-09 15:04:53', '结算菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1105, '结算查询', 1104, 1, '#', '', 1, 0, 'F', '0', '0', 'agent:record:query', '#', 'admin', '2021-07-20 18:25:28', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1106, '结算新增', 1104, 2, '#', '', 1, 0, 'F', '0', '0', 'agent:record:add', '#', 'admin', '2021-07-20 18:25:28', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1107, '结算修改', 1104, 3, '#', '', 1, 0, 'F', '0', '0', 'agent:record:edit', '#', 'admin', '2021-07-20 18:25:28', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1108, '结算删除', 1104, 4, '#', '', 1, 0, 'F', '0', '0', 'agent:record:remove', '#', 'admin', '2021-07-20 18:25:28', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1109, '结算导出', 1104, 5, '#', '', 1, 0, 'F', '0', '0', 'agent:record:export', '#', 'admin', '2021-07-20 18:25:28', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1111, '业务介绍', 0, 1, 'introduce', 'introduce/introduce/index', 1, 0, 'C', '0', '0', 'system:introduce:list', 'dict', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:19', '业务介绍菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1112, '业务介绍查询', 1111, 1, '#', '', 1, 0, 'F', '0', '0', 'system:introduce:query', '#', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:29', '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1113, '业务介绍新增', 1111, 2, '#', '', 1, 0, 'F', '0', '0', 'system:introduce:add', '#', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:33', '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1114, '业务介绍修改', 1111, 3, '#', '', 1, 0, 'F', '0', '0', 'system:introduce:edit', '#', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:38', '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1115, '业务介绍删除', 1111, 4, '#', '', 1, 0, 'F', '0', '0', 'system:introduce:remove', '#', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:42', '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1116, '业务介绍导出', 1111, 5, '#', '', 1, 0, 'F', '0', '0', 'system:introduce:export', '#', 'admin', '2021-08-04 03:01:08', 'admin', '2022-01-05 21:22:50', '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1117, '会员流水', 1129, 3, 'history', 'member/history/index', 1, 0, 'C', '0', '0', 'member:history:list', 'time', 'admin', '2021-08-08 16:10:03', 'admin', '2021-08-08 16:13:44', '会员流水菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1118, '会员流水查询', 1117, 1, '#', '', 1, 0, 'F', '0', '0', 'member:history:query', '#', 'admin', '2021-08-08 16:10:03', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1119, '会员流水新增', 1117, 2, '#', '', 1, 0, 'F', '0', '0', 'member:history:add', '#', 'admin', '2021-08-08 16:10:03', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1120, '会员流水修改', 1117, 3, '#', '', 1, 0, 'F', '0', '0', 'member:history:edit', '#', 'admin', '2021-08-08 16:10:03', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1121, '会员流水删除', 1117, 4, '#', '', 1, 0, 'F', '0', '0', 'member:history:remove', '#', 'admin', '2021-08-08 16:10:03', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1122, '会员流水导出', 1117, 5, '#', '', 1, 0, 'F', '0', '0', 'member:history:export', '#', 'admin', '2021-08-08 16:10:03', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1123, '会员充值', 1129, 2, 'trade', 'member/trade/index', 1, 0, 'C', '0', '0', 'member:trade:list', 'money', 'admin', '2021-08-08 16:10:11', 'admin', '2021-08-08 16:13:22', '会员充值菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1124, '会员充值查询', 1123, 1, '#', '', 1, 0, 'F', '0', '0', 'member:trade:query', '#', 'admin', '2021-08-08 16:10:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1125, '会员充值新增', 1123, 2, '#', '', 1, 0, 'F', '0', '0', 'member:trade:add', '#', 'admin', '2021-08-08 16:10:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1126, '会员充值修改', 1123, 3, '#', '', 1, 0, 'F', '0', '0', 'member:trade:edit', '#', 'admin', '2021-08-08 16:10:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1127, '会员充值删除', 1123, 4, '#', '', 1, 0, 'F', '0', '0', 'member:trade:remove', '#', 'admin', '2021-08-08 16:10:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1128, '会员充值导出', 1123, 5, '#', '', 1, 0, 'F', '0', '0', 'member:trade:export', '#', 'admin', '2021-08-08 16:10:11', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1129, '会员管理', 0, 3, 'member', null, 1, 0, 'M', '0', '0', null, 'people', 'admin', '2021-08-08 16:12:42', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1130, '代理管理', 0, 2, 'agent', null, 1, 0, 'M', '0', '0', null, 'peoples', 'admin', '2021-08-09 15:04:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1131, '订单统计', 1130, 4, 'ordersSta', 'agent/agent/ordersSta', 1, 0, 'C', '0', '0', 'agent:agent:list', 'money', 'admin', '2021-12-01 10:57:13', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1132, '客服管理', 0, 1, 'servicer', 'system/servicer/index', 1, 0, 'C', '0', '0', 'system:servicer:list', 'qq', 'admin', '2021-12-15 12:17:19', 'admin', '2021-12-15 12:18:25', '??-???菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1133, '??-???查询', 1132, 1, '#', '', 1, 0, 'F', '0', '0', 'system:servicer:query', '#', 'admin', '2021-12-15 12:17:19', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1134, '??-???新增', 1132, 2, '#', '', 1, 0, 'F', '0', '0', 'system:servicer:add', '#', 'admin', '2021-12-15 12:17:19', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1135, '??-???修改', 1132, 3, '#', '', 1, 0, 'F', '0', '0', 'system:servicer:edit', '#', 'admin', '2021-12-15 12:17:19', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1136, '??-???删除', 1132, 4, '#', '', 1, 0, 'F', '0', '0', 'system:servicer:remove', '#', 'admin', '2021-12-15 12:17:19', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1137, '??-???导出', 1132, 5, '#', '', 1, 0, 'F', '0', '0', 'system:servicer:export', '#', 'admin', '2021-12-15 12:17:19', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1138, '补款申请', 1130, 5, 'trade', 'agent/trade/index', 1, 0, 'C', '0', '0', 'agent:trade:list', 'form', 'admin', '2022-01-05 15:43:00', 'admin', '2022-01-05 15:50:47', '代理充值菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1139, '代理充值查询', 1138, 1, '#', '', 1, 0, 'F', '0', '0', 'agent:trade:query', '#', 'admin', '2022-01-05 15:43:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1140, '代理充值新增', 1138, 2, '#', '', 1, 0, 'F', '0', '0', 'agent:trade:add', '#', 'admin', '2022-01-05 15:43:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1141, '代理充值修改', 1138, 3, '#', '', 1, 0, 'F', '0', '0', 'agent:trade:edit', '#', 'admin', '2022-01-05 15:43:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1142, '代理充值删除', 1138, 4, '#', '', 1, 0, 'F', '0', '0', 'agent:trade:remove', '#', 'admin', '2022-01-05 15:43:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1143, '代理充值导出', 1138, 5, '#', '', 1, 0, 'F', '0', '0', 'agent:trade:export', '#', 'admin', '2022-01-05 15:43:00', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1144, '会员通知', 0, 1, 'membernotice', 'member/notice/index', 1, 0, 'C', '0', '0', 'member:notice:list', 'qq', 'admin', '2022-01-07 01:09:51', 'admin', '2022-01-07 01:11:29', '会员通知菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1145, '会员通知查询', 1144, 1, '#', '', 1, 0, 'F', '0', '0', 'member:notice:query', '#', 'admin', '2022-01-07 01:09:51', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1146, '会员通知新增', 1144, 2, '#', '', 1, 0, 'F', '0', '0', 'member:notice:add', '#', 'admin', '2022-01-07 01:09:51', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1147, '会员通知修改', 1144, 3, '#', '', 1, 0, 'F', '0', '0', 'member:notice:edit', '#', 'admin', '2022-01-07 01:09:51', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1148, '会员通知删除', 1144, 4, '#', '', 1, 0, 'F', '0', '0', 'member:notice:remove', '#', 'admin', '2022-01-07 01:09:51', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1149, '会员通知导出', 1144, 5, '#', '', 1, 0, 'F', '0', '0', 'member:notice:export', '#', 'admin', '2022-01-07 01:09:51', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1150, '价格导出', 1068, 6, '', null, 1, 0, 'F', '0', '0', 'member:goods:export', '#', 'admin', '2022-01-09 16:21:37', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1151, '价格导入', 1068, 7, '', null, 1, 0, 'F', '0', '0', 'member:goods:import', '#', 'admin', '2022-01-09 16:21:59', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1152, '支付宝配置', 1, 2, 'alipayconfig', 'system/alipayconfig/index', 1, 0, 'C', '0', '0', 'system:alipayconfig:list', 'money', 'admin', '2022-05-15 23:15:40', 'admin', '2022-05-15 23:39:00', '支付宝当面付配置菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1153, '支付宝当面付配置查询', 1152, 1, '#', '', 1, 0, 'F', '0', '0', 'system:alipayconfig:query', '#', 'admin', '2022-05-15 23:15:40', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1154, '支付宝当面付配置新增', 1152, 2, '#', '', 1, 0, 'F', '0', '0', 'system:alipayconfig:add', '#', 'admin', '2022-05-15 23:15:40', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1155, '支付宝当面付配置修改', 1152, 3, '#', '', 1, 0, 'F', '0', '0', 'system:alipayconfig:edit', '#', 'admin', '2022-05-15 23:15:40', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1156, '支付宝当面付配置删除', 1152, 4, '#', '', 1, 0, 'F', '0', '0', 'system:alipayconfig:remove', '#', 'admin', '2022-05-15 23:15:40', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1157, '支付宝当面付配置导出', 1152, 5, '#', '', 1, 0, 'F', '0', '0', 'system:alipayconfig:export', '#', 'admin', '2022-05-15 23:15:40', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1158, '直客通道配置', 0, 7, 'config', 'zhike/config/index', 1, 0, 'C', '0', '0', 'zhike:config:list', 'lock', 'admin', '2022-05-15 23:15:48', 'admin', '2022-05-15 23:38:43', '直客通道配置菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1159, '直客通道配置查询', 1158, 1, '#', '', 1, 0, 'F', '0', '0', 'zhike:config:query', '#', 'admin', '2022-05-15 23:15:48', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1160, '直客通道配置新增', 1158, 2, '#', '', 1, 0, 'F', '0', '0', 'zhike:config:add', '#', 'admin', '2022-05-15 23:15:48', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1161, '直客通道配置修改', 1158, 3, '#', '', 1, 0, 'F', '0', '0', 'zhike:config:edit', '#', 'admin', '2022-05-15 23:15:48', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1162, '直客通道配置删除', 1158, 4, '#', '', 1, 0, 'F', '0', '0', 'zhike:config:remove', '#', 'admin', '2022-05-15 23:15:48', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1163, '直客通道配置导出', 1158, 5, '#', '', 1, 0, 'F', '0', '0', 'zhike:config:export', '#', 'admin', '2022-05-15 23:15:48', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1164, '代理IP设置', 1, 2, 'proxy', 'system/proxy/index', 1, 0, 'C', '0', '0', 'system:proxy:list', 'system', 'admin', '2022-05-15 23:15:56', 'admin', '2022-05-15 23:39:21', 'http代理设置菜单');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1165, 'http代理设置查询', 1164, 1, '#', '', 1, 0, 'F', '0', '0', 'system:proxy:query', '#', 'admin', '2022-05-15 23:15:56', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1166, 'http代理设置新增', 1164, 2, '#', '', 1, 0, 'F', '0', '0', 'system:proxy:add', '#', 'admin', '2022-05-15 23:15:56', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1167, 'http代理设置修改', 1164, 3, '#', '', 1, 0, 'F', '0', '0', 'system:proxy:edit', '#', 'admin', '2022-05-15 23:15:56', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1168, 'http代理设置删除', 1164, 4, '#', '', 1, 0, 'F', '0', '0', 'system:proxy:remove', '#', 'admin', '2022-05-15 23:15:56', '', null, '');
INSERT INTO `tianyin_admin`.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1169, 'http代理设置导出', 1164, 5, '#', '', 1, 0, 'F', '0', '0', 'system:proxy:export', '#', 'admin', '2022-05-15 23:15:56', '', null, '');






INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-06-21 19:55:22', '', null, '');
INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-06-21 19:55:22', '', null, '');
INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-06-21 19:55:22', '', null, '');
INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (4, 'addMemberkey', 'DEFAULT', 'ryTask.addMemberPrivateKeyOfnull', ' 0 0 0 * * ?', '1', '1', '1', 'admin', '2021-10-30 11:11:30', '', null, '');
INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (5, '强退超过两个小时的订单', 'DEFAULT', 'ryTask.updateBeyond2HOrdersList', '0 */1 * * * ?', '1', '1', '0', 'admin', '2022-01-16 20:51:12', 'admin', '2022-01-17 10:09:23', '');
INSERT INTO `tianyin_admin`.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) VALUES (6, '定时回调三方失败的订单', 'DEFAULT', 'ryTask.requestThirdPlatform', ' 0 */1 * * * ?', '1', '1', '0', 'admin', '2022-02-12 00:56:15', 'admin', '2022-02-12 01:00:29', '');


INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-06-21 19:55:21', '', null, '用户性别列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-06-21 19:55:21', '', null, '菜单状态列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-06-21 19:55:21', '', null, '系统开关列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-06-21 19:55:21', '', null, '任务状态列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-06-21 19:55:21', '', null, '任务分组列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-06-21 19:55:21', '', null, '系统是否列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-06-21 19:55:21', '', null, '通知类型列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-06-21 19:55:21', '', null, '通知状态列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-06-21 19:55:21', '', null, '操作类型列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-06-21 19:55:21', '', null, '登录状态列表');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (11, '删除标志', 'delete_flag', '0', 'admin', '2021-06-23 08:52:57', '', null, '删除标志');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (12, '平台', 'platform', '0', 'admin', '2021-06-23 08:54:54', 'admin', '2021-06-23 08:55:02', '平台');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (13, '订单状态', 'order_status', '0', 'admin', '2021-06-25 12:48:43', '', null, '订单状态');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (14, '子订单状态', 'child_order_status', '0', 'admin', '2021-06-25 17:57:05', 'admin', '2021-06-25 17:57:13', '子订单状态');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (15, '子订单审核状态', 'order_audit_status', '0', 'admin', '2021-06-28 09:45:42', 'admin', '2021-07-20 02:05:54', '审核状态');
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (16, '资金变动方向', 'change_direction', '0', 'admin', '2021-07-20 02:07:52', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (17, '业务类型', 'biz_type', '0', 'admin', '2021-07-20 02:08:32', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (18, '是否需要锁定', 'goods_lock', '0', 'admin', '2021-07-20 02:09:18', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (19, '账户类型', 'account_type', '0', 'admin', '2021-07-20 18:23:47', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (20, '结算状态', 'sett_status', '0', 'admin', '2021-07-20 18:24:28', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (21, '是否预约', 'is_yuyue', '0', 'admin', '2021-08-04 02:59:13', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (22, '充值状态', 'trade_status', '0', 'admin', '2021-08-08 15:50:33', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (23, '会员业务类型', 'member_biz_type', '0', 'admin', '2021-08-08 15:51:17', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (24, '是否新代理', 'agent_new_old', '0', 'admin', '2022-01-23 21:43:03', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (25, '平台', 'third_platform', '0', 'admin', '2022-02-24 22:57:02', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (26, '是否需要审核', 'need_shenhe', '0', 'admin', '2022-05-15 23:35:01', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (27, '获取抖音数量类型', 'douyin_num_type', '0', 'admin', '2022-05-15 23:35:31', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (28, '是否需要上传凭证', 'is_upload_pic', '0', 'admin', '2022-05-15 23:36:21', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (29, '是否支持', 'is_support', '0', 'admin', '2022-05-15 23:36:55', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (30, '订单属性', 'order_attribute', '0', 'admin', '2022-05-15 23:37:23', '', null, null);


INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '性别男');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '性别女');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '性别未知');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '显示菜单');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '隐藏菜单');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '正常状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '停用状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '正常状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '停用状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '默认分组');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '系统分组');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '系统默认是');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '系统默认否');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '通知');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '公告');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '正常状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '关闭状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '新增操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '修改操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '删除操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '授权操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '导出操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '导入操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '强退操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '生成操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '清空操作');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '正常状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '', '0', 'admin', '2021-06-21 19:55:21', '', null, '停用状态');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (29, 0, '存在', '0', 'delete_flag', null, null, 'N', '', '0', 'admin', '2021-06-23 08:53:22', '', null, '存在');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (30, 1, '删除', '2', 'delete_flag', null, null, 'N', '', '0', 'admin', '2021-06-23 08:53:32', '', null, '删除');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (31, 1, '抖音业务', '1', 'platform', null, null, 'N', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/4537d403-4e76-4388-8982-1246d3ce9e32.png', '0', 'admin', '2021-06-23 08:55:15', 'admin', '2021-12-20 11:37:22', '为你推荐');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (32, 3, '快手业务', '2', 'platform', null, null, 'N', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/47eccbea-ed1d-4aea-965e-07bbbd90601f.png', '0', 'admin', '2021-06-23 08:55:24', 'admin', '2021-12-20 11:37:36', '热门必备');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (33, 5, ' 抖音盒子', '3', 'platform', null, null, 'N', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/408ff5d4-607e-473b-b746-cefc39020642.png', '0', 'admin', '2021-06-23 08:56:00', 'admin', '2021-12-20 11:37:51', '流量扶持');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (34, 2, '抖音直播间', '4', 'platform', null, null, 'N', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/4b9d1dd3-551b-40c3-865b-c6a34724920d.png', '0', 'admin', '2021-06-23 08:57:22', 'admin', '2021-12-20 11:37:29', '引流玩法');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (35, 4, '快手直播间', '5', 'platform', null, null, 'N', 'http://houtai.tianyinchuanmei.com/profile/uploadBase/2021/12/20/c8fec6ba-cb4f-4e1d-adf4-478fd4a94197.png', '0', 'admin', '2021-06-23 08:57:34', 'admin', '2021-12-20 11:37:42', '网红帮扶');
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (36, 0, '未处理', '0', 'order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 12:49:04', 'admin', '2021-07-18 17:20:51', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (37, 1, '待接订单', '1', 'order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 12:49:18', 'admin', '2021-07-24 21:57:45', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (38, 2, '已接订单', '2', 'order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 12:49:47', 'admin', '2021-07-24 21:56:07', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (39, 3, '已完成', '3', 'order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 12:50:00', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (40, 9, '驳回', '9', 'order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 12:51:40', 'admin', '2021-06-28 10:07:57', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (41, 0, '处理中', '2', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 17:57:32', 'admin', '2021-07-20 02:04:17', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (42, 1, '已完成', '3', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-06-25 17:57:45', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (43, 4, '审核通过', '4', 'order_audit_status', null, null, 'N', '', '0', 'admin', '2021-06-28 09:45:55', 'admin', '2021-07-20 02:07:06', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (44, 5, '审核(部分退单)', '5', 'order_audit_status', null, null, 'N', '', '0', 'admin', '2021-06-28 09:46:11', 'admin', '2021-07-20 02:07:17', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (45, 4, '退回', '4', 'order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:03:17', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (46, 5, '异常', '5', 'order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:03:25', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (47, 3, '审核通过', '4', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:04:32', 'admin', '2021-07-25 02:31:58', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (48, 4, '审核(部分退单)', '5', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:04:44', 'admin', '2021-07-25 02:32:04', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (49, 5, '退单中', '6', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:04:52', 'admin', '2021-07-25 02:32:15', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (50, 7, '异常申请', '7', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:05:01', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (51, 8, '异常已处理', '8', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-20 02:05:09', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (52, 1, '加款', '1', 'change_direction', null, null, 'N', '', '0', 'admin', '2021-07-20 02:08:08', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (53, 2, '减款', '2', 'change_direction', null, null, 'N', '', '0', 'admin', '2021-07-20 02:08:15', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (54, 1, '利润', '1', 'biz_type', null, null, 'N', '', '0', 'admin', '2021-07-20 02:08:42', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (55, 2, '提现', '2', 'biz_type', null, null, 'N', '', '0', 'admin', '2021-07-20 02:08:49', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (56, 3, '调账', '3', 'biz_type', null, null, 'N', '', '0', 'admin', '2021-07-20 02:08:57', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (57, 1, '不锁定', '1', 'goods_lock', null, null, 'N', '', '0', 'admin', '2021-07-20 02:09:28', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (58, 2, '锁定', '2', 'goods_lock', null, null, 'N', '', '0', 'admin', '2021-07-20 02:09:35', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (59, 1, '微信', '1', 'account_type', null, null, 'N', '', '0', 'admin', '2021-07-20 18:23:59', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (60, 2, '支付宝', '2', 'account_type', null, null, 'N', '', '0', 'admin', '2021-07-20 18:24:05', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (61, 2, '银行卡', '2', 'account_type', null, null, 'N', '', '0', 'admin', '2021-07-20 18:24:12', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (62, 1, '等待审核', '1', 'sett_status', null, null, 'N', '', '0', 'admin', '2021-07-20 18:24:38', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (63, 2, '已审核', '2', 'sett_status', null, null, 'N', '', '0', 'admin', '2021-07-20 18:24:46', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (64, 3, '驳回', '3', 'sett_status', null, null, 'N', '', '0', 'admin', '2021-07-20 18:24:54', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (65, 4, '已打款', '4', 'sett_status', null, null, 'N', '', '0', 'admin', '2021-07-20 18:25:02', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (66, 6, '已退单', '9', 'child_order_status', null, null, 'N', '', '0', 'admin', '2021-07-25 02:32:28', 'admin', '2021-10-25 10:25:32', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (67, 1, '普通单', '1', 'is_yuyue', null, null, 'N', '', '0', 'admin', '2021-08-04 02:59:27', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (68, 2, '预约单', '2', 'is_yuyue', null, null, 'N', '', '0', 'admin', '2021-08-04 02:59:34', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (69, 1, '等待审核', '1', 'trade_status', null, null, 'N', '', '0', 'admin', '2021-08-08 15:50:46', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (70, 2, '已审核', '2', 'trade_status', null, null, 'N', '', '0', 'admin', '2021-08-08 15:50:54', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (71, 3, '驳回', '3', 'trade_status', null, null, 'N', '', '0', 'admin', '2021-08-08 15:51:00', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (72, 1, '充值', '1', 'member_biz_type', null, null, 'N', '', '0', 'admin', '2021-08-08 15:51:30', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (73, 2, '下单', '2', 'member_biz_type', null, null, 'N', '', '0', 'admin', '2021-08-08 15:51:37', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (74, 3, '调账', '3', 'member_biz_type', null, null, 'N', '', '0', 'admin', '2021-08-08 15:51:44', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (75, 4, '补款', '4', 'biz_type', null, null, 'N', '', '0', 'admin', '2022-01-05 14:51:21', 'admin', '2022-01-05 16:11:31', null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (77, 6, '已退款', '6', 'order_status', null, null, 'N', '', '0', 'admin', '2022-01-17 17:39:43', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (79, 1, '新代理', '1', 'agent_new_old', null, null, 'N', '', '0', 'admin', '2022-01-23 21:43:16', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (80, 2, '老代理', '2', 'agent_new_old', null, null, 'N', '', '0', 'admin', '2022-01-23 21:43:23', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (81, 4, '订单退款', '4', 'member_biz_type', null, null, 'N', '', '0', 'admin', '2022-02-10 18:03:06', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (82, 0, '自营', '0', 'third_platform', null, null, 'N', '', '0', 'admin', '2022-02-24 22:57:15', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (83, 1, '乔治', '1', 'third_platform', null, null, 'N', '', '0', 'admin', '2022-02-24 22:57:23', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (84, 0, '不需要', '0', 'need_shenhe', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:10', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (85, 1, '需要', '1', 'need_shenhe', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:16', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (86, 1, '抖音点赞数', '1', 'douyin_num_type', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:39', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (87, 2, '抖音评论数', '2', 'douyin_num_type', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:45', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (88, 3, '抖音分享数', '3', 'douyin_num_type', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:51', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (89, 4, '抖音粉丝数', '4', 'douyin_num_type', null, null, 'N', '', '0', 'admin', '2022-05-15 23:35:58', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (90, 5, '抖音收藏数', '5', 'douyin_num_type', null, null, 'N', '', '0', 'admin', '2022-05-15 23:36:06', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (91, 0, '不需要', '0', 'is_upload_pic', null, null, 'N', '', '0', 'admin', '2022-05-15 23:36:32', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (92, 1, '需要', '1', 'is_upload_pic', null, null, 'N', '', '0', 'admin', '2022-05-15 23:36:38', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (93, 0, '关闭', '0', 'is_support', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:04', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (94, 1, '开启', '1', 'is_support', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:10', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (95, 0, '普通', '0', 'order_attribute', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:34', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (96, 1, '美妆', '1', 'order_attribute', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:41', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (97, 2, '美食', '2', 'order_attribute', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:48', '', null, null);
INSERT INTO `tianyin_admin`.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, pic_path, status, create_by, create_time, update_by, update_time, remark) VALUES (98, 3, '健身', '3', 'order_attribute', null, null, 'N', '', '0', 'admin', '2022-05-15 23:37:55', '', null, null);


INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (100, 0, '0', '天音科技', 0, '天音', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-06-21 19:55:21', 'admin', '2021-07-15 20:12:54');
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (101, 100, '0,100', '杭州公司', 1, '李牧', '15888888888', '123123@qq.com', '0', '0', 'admin', '2021-06-21 19:55:21', 'admin', '2022-01-20 03:07:43');
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);
INSERT INTO `tianyin_admin`.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-06-21 19:55:21', '', null);


INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-06-21 19:55:21', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-06-21 19:55:21', '', null, '初始化密码 123456');
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-06-21 19:55:21', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (4, '代理提现最低额度', 'agent.sett.record', '10', 'N', 'admin', '2021-07-20 18:23:12', 'admin', '2021-07-22 17:14:47', '键值必须为整数');
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (5, '是否开启推荐码', 'member.recomm.number', '0', 'Y', 'admin', '2021-12-09 23:48:57', 'admin', '2022-02-25 00:12:03', '0关闭；1开启');
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (6, '会员下单余额无需验证的ID', 'member.account.amount', '0d8bbb021f6d40659ea4dd2eb8a03815', 'Y', 'admin', '2022-01-05 23:20:35', 'admin', '2022-01-26 21:12:11', null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (7, '老代理订单数量限制', 'agent.order.num', '200', 'Y', 'admin', '2022-01-23 21:38:32', 'admin', '2022-02-15 14:40:30', null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (8, '当日订单增加数量', 'today.order.num', '500', 'Y', 'admin', '2022-02-13 10:50:18', '', null, null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (9, '当日订单增加金额', 'today.order.amount', '13000', 'Y', 'admin', '2022-02-13 10:50:43', '', null, null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (10, '当日代理增加收入', 'today.agent.amount', '10000', 'Y', 'admin', '2022-02-13 10:51:04', '', null, null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (11, '当日增加利润', 'today.order.profit', '3000', 'Y', 'admin', '2022-02-13 10:51:23', '', null, null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (12, '增加代理总收入', 'all.agent.amount', '1000000', 'Y', 'admin', '2022-02-13 11:12:18', '', null, null);
INSERT INTO `tianyin_admin`.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) VALUES (13, '增加订单总金额', 'all.order.amount', '800000', 'Y', 'admin', '2022-02-13 11:22:41', '', null, null);


INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, 1686504590000, -1, 5, 'PAUSED', 'CRON', 1686504587000, 0, null, 2, 0x00);
INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, 1686504600000, -1, 5, 'PAUSED', 'CRON', 1686504587000, 0, null, 2, 0x00);
INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, 1686504600000, -1, 5, 'PAUSED', 'CRON', 1686504587000, 0, null, 2, 0x00);
INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', 'TASK_CLASS_NAME4', 'DEFAULT', null, 1686585600000, -1, 5, 'PAUSED', 'CRON', 1686504587000, 0, null, -1, 0x00);
INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', 'TASK_CLASS_NAME5', 'DEFAULT', null, 1686548160000, 1686548100000, 5, 'ACQUIRED', 'CRON', 1686504587000, 0, null, -1, 0x00);
INSERT INTO `tianyin_admin`.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', 'TASK_CLASS_NAME6', 'DEFAULT', null, 1686548160000, 1686548100000, 5, 'WAITING', 'CRON', 1686504588000, 0, null, -1, 0x00);


INSERT INTO `tianyin_admin`.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) VALUES ('RuoyiScheduler', 'ecs-4bfc1686504587342', 1686548128300, 15000);




INSERT INTO `tianyin_admin`.qrtz_locks (sched_name, lock_name) VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `tianyin_admin`.qrtz_locks (sched_name, lock_name) VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');


INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A2E6CD41078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A2E6CD41078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A2E6CD41078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CCF2E4AD078707400007070707400013174000C203020302030202A202A203F74002072795461736B2E6164644D656D626572507269766174654B65794F666E756C6C74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000C6164644D656D6265726B657974000131740001317800);
INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E62F10E0078707400007070707400013174000D30202A2F31202A202A202A203F74001F72795461736B2E7570646174654265796F6E6432484F72646572734C69737474000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000005740021E5BCBAE98080E8B685E8BF87E4B8A4E4B8AAE5B08FE697B6E79A84E8AEA2E58D9574000131740001307800);
INSERT INTO `tianyin_admin`.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017EE9B6BF9878707400007070707400013174000E2030202A2F31202A202A202A203F74001B72795461736B2E726571756573745468697264506C6174666F726D74000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000006740021E5AE9AE697B6E59B9EE8B083E4B889E696B9E5A4B1E8B4A5E79A84E8AEA2E58D9574000131740001307800);


INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', ' 0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME5', 'DEFAULT', '0 */1 * * * ?', 'Asia/Shanghai');
INSERT INTO `tianyin_admin`.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', ' 0 */1 * * * ?', 'Asia/Shanghai');


INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (1, '1', 'agent_id', '代理ID', 'varchar(64)', 'String', 'agentId', '1', '0', null, null, null, null, null, 'EQ', 'input', '', 1, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (2, '1', 'login_name', '登录账号', 'varchar(32)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (3, '1', 'nick_name', '昵      称', 'varchar(32)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (4, '1', 'phone_number', '手 机 号', 'varchar(11)', 'String', 'phoneNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (5, '1', 'email', '邮      箱', 'varchar(64)', 'String', 'email', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', 5, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (6, '1', 'sex', '性      别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (7, '1', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', null, '1', null, '1', null, 'EQ', 'imageUpload', '', 7, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (8, '1', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', 8, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (9, '1', 'status', '帐号状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 9, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (10, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 10, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (11, '1', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 11, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (12, '1', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 12, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (13, '1', 'create_by_id', '管理账号', 'bigint(20)', 'Long', 'createById', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (14, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (15, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 15, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (16, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 16, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (17, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', null, null, 'EQ', 'textarea', '', 17, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 11:47:40');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (18, '2', 'member_id', '会员ID', 'varchar(64)', 'String', 'memberId', '1', '0', null, null, null, null, null, 'EQ', 'input', '', 1, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (19, '2', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', null, null, null, null, null, 'LIKE', 'input', '', 2, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (20, '2', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 3, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (21, '2', 'nick_name', '昵称', 'varchar(30)', 'String', 'nickName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (22, '2', 'phone_number', '手机号', 'varchar(11)', 'String', 'phoneNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (23, '2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (24, '2', 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', null, '1', '1', '1', null, 'EQ', 'imageUpload', '', 7, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (25, '2', 'wx_open_id', '微信openId', 'varchar(40)', 'String', 'wxOpenId', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 8, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (26, '2', 'wx_union_id', '微信UnionID', 'varchar(40)', 'String', 'wxUnionId', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 9, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (27, '2', 'wx_account', '微信号', 'varchar(40)', 'String', 'wxAccount', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 10, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (28, '2', 'email', '邮箱', 'varchar(40)', 'String', 'email', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 11, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (29, '2', 'country', '国家', 'varchar(40)', 'String', 'country', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 12, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (30, '2', 'province', '省份', 'varchar(40)', 'String', 'province', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 13, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (31, '2', 'city', '城市', 'varchar(40)', 'String', 'city', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (32, '2', 'status', '帐号状态', 'char(1)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 15, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (33, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 16, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (34, '2', 'create_time', '注册时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (35, '2', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 18, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (36, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 19, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (37, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', null, null, 'EQ', 'textarea', '', 20, 'admin', '2021-06-23 08:59:20', '', '2021-06-23 15:34:20');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (38, '3', 'notice_id', 'ID', 'bigint(20)', 'Long', 'noticeId', '1', '1', null, null, null, null, null, 'EQ', 'input', '', 1, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (39, '3', 'notice_title', '标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (40, '3', 'pic_path', '图片', 'varchar(100)', 'String', 'picPath', '0', '0', '1', '1', '1', '1', null, 'EQ', 'imageUpload', '', 3, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (41, '3', 'notice_content', '内容', 'longblob', 'String', 'noticeContent', '0', '0', '1', '1', '1', null, null, 'EQ', 'editor', '', 4, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (42, '3', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 5, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (43, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (44, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (45, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 8, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (46, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 9, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (47, '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, null, null, null, null, 'EQ', 'textarea', '', 10, 'admin', '2021-06-23 09:49:30', '', '2021-06-23 16:07:09');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (48, '4', 'goods_id', '商品ID', 'varchar(64)', 'String', 'goodsId', '1', '0', null, null, null, null, null, 'EQ', 'input', '', 1, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (49, '4', 'pic_path', '主图', 'varchar(100)', 'String', 'picPath', '0', '0', '1', '1', '1', '1', null, 'EQ', 'imageUpload', '', 2, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (50, '4', 'good_title', '商品标题', 'varchar(100)', 'String', 'goodTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (51, '4', 'goods_brief', '商品简介', 'varchar(255)', 'String', 'goodsBrief', '0', '0', null, '1', '1', null, null, 'LIKE', 'textarea', '', 4, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (52, '4', 'goods_desc', '商品详情', 'longblob', 'String', 'goodsDesc', '0', '0', '1', '1', '1', null, null, 'EQ', 'editor', '', 5, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (53, '4', 'goods_number', '商品数量', 'mediumint(9)', 'Integer', 'goodsNumber', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 6, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (54, '4', 'goods_price', '商品价格', 'decimal(10,2)', 'BigDecimal', 'goodsPrice', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 7, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (55, '4', 'goods_unit', '商品单位', 'varchar(45)', 'String', 'goodsUnit', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 8, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (56, '4', 'sell_volume', '销量', 'int(11)', 'Long', 'sellVolume', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', 9, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (57, '4', 'platform', '品牌', 'char(1)', 'String', 'platform', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'platform', 10, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (58, '4', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 11, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (59, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 12, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (60, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', 13, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (61, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'BETWEEN', 'datetime', '', 14, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (62, '4', 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 15, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (63, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 16, 'admin', '2021-06-25 09:50:19', '', '2021-06-25 11:04:08');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (64, '5', 'order_id', '订单ID', 'varchar(64)', 'String', 'orderId', '1', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (65, '5', 'member_id', '会员ID', 'varchar(64)', 'String', 'memberId', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (66, '5', 'goods_id', '商品ID', 'varchar(64)', 'String', 'goodsId', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (67, '5', 'goods_price', '拍单价格', 'decimal(10,2)', 'BigDecimal', 'goodsPrice', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (68, '5', 'goods_unit', '商品单位', 'varchar(45)', 'String', 'goodsUnit', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', 5, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (69, '5', 'hours_num', '小时数', 'tinyint(4)', 'Integer', 'hoursNum', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 6, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (70, '5', 'machine_num', '机位数量', 'mediumint(9)', 'Integer', 'machineNum', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 7, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (71, '5', 'page_url', '主页链接', 'varchar(255)', 'String', 'pageUrl', '0', '0', '1', '1', '1', '1', null, 'EQ', 'input', '', 8, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (72, '5', 'order_status', '订单状态', 'char(1)', 'String', 'orderStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'order_status', 9, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (73, '5', 'create_time', '提交时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 10, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (74, '5', 'audit_time', '审核时间', 'datetime', 'Date', 'auditTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', 11, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (75, '5', 'assigned_time', '分配时间', 'datetime', 'Date', 'assignedTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', 12, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (76, '5', 'complete_time', '完成时间', 'datetime', 'Date', 'completeTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', 13, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (77, '5', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', null, null, 'EQ', 'textarea', '', 14, 'admin', '2021-06-25 12:44:50', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (78, '5', 'order_amount', '订单金额', 'decimal(10,2)', 'BigDecimal', 'orderAmount', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2021-06-25 17:08:23', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (79, '5', 'machine_assigned_num', '已分配机位数', 'mediumint(9)', 'Integer', 'machineAssignedNum', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2021-06-25 18:19:38', '', '2021-07-15 11:38:53');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (80, '6', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', null, null, null, null, null, 'EQ', 'input', '', 1, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (81, '6', 'order_id', '订单ID', 'varchar(64)', 'String', 'orderId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (82, '6', 'agent_id', '代理ID', 'varchar(64)', 'String', 'agentId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (83, '6', 'goods_price', '分单价格', 'decimal(10,2)', 'BigDecimal', 'goodsPrice', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', 4, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (84, '6', 'hours_num', '小时数', 'tinyint(4)', 'Integer', 'hoursNum', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', 5, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (85, '6', 'machine_num', '机位数', 'mediumint(9)', 'Integer', 'machineNum', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', 6, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (86, '6', 'order_amount', '子订单金额', 'decimal(10,2)', 'BigDecimal', 'orderAmount', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', 7, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (87, '6', 'order_status', '子订单状态（2已接单，3已完成）', 'char(1)', 'String', 'orderStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'child_order_status', 8, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (88, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, null, null, '1', null, 'EQ', 'input', '', 9, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (89, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'BETWEEN', 'datetime', '', 10, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (90, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', 11, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (91, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', 12, 'admin', '2021-06-25 21:54:29', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (92, '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', null, '1', '1', null, null, 'EQ', 'textarea', '', 13, '', '2021-06-25 21:58:03', '', '2021-06-25 22:02:21');
INSERT INTO `tianyin_admin`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (93, '1', 'machine_num', '机位数量', 'mediumint(9)', 'Integer', 'machineNum', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2021-07-14 18:43:33', '', null);





