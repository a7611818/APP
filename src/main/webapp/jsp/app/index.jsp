<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${ctx}/static/plugin/layui/css/layui.css">
    <style>
        table tr th:first-of-type{
            width: 10%;
        }

        table tr th:nth-of-type(2){
            width: 20%;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="/comment/head.jsp" %>
    <%@include file="/comment/left.jsp" %>

    <div class="layui-body">
        <div style="...">

        <form action="${ctx}/app/query" method="post" class="layui-form">

            <div class="layui-form-item">

                <div class="layui-input-inline">
                    <input type="hidden" name="pageNum" value="1">
                </div>
                <label class="layui-form-label">软件名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${appInfoDTO.softwareName}">
                </div>

                <label class="layui-form-label">App状态</label>
                <div class="layui-input-inline">
                    <select name="appStatus" lay-filter="aihao">
                        <option value="">请选择</option>
                        <c:forEach items="${appStatuses}" var="obj">

                            <option value="${obj.id}"<c:if test="${obj.id eq appInfoDTO.appStatus}">
                                selected
                            </c:if>>${obj.valueName}</option>
                        </c:forEach>
                    </select>
                </div>
                <label class="layui-form-label">所属平台</label>
                <div class="layui-input-inline">
                    <select name="appFlatform" lay-filter="aihao">
                        <option value="">请选择</option>
                        <c:forEach items="${appFlatforms}" var="obj">
                            <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.appFlatform}">
                                selected
                            </c:if>>${obj.valueName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">

                <label class="layui-form-label">一级分类</label>
                <div class="layui-input-inline">
                    <select name="levelOne" id="level1" lay-filter="level1">
                        <option value="">请选择</option>
                        <c:forEach items="${level1}" var="obj">
                            <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.levelOne}">
                                selected
                            </c:if>>${obj.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>

                <label class="layui-form-label">二级分类</label>
                <div class="layui-input-inline">
                    <select name="levelTwo" lay-filter="level2" id="level2">

                    </select>
                </div>

                <label class="layui-form-label">三级分类</label>
                <div class="layui-input-inline">
                    <select name="levelThree" lay-filter="level3" id="level3">

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>

            </div>
        </form>
            <div class="layui-input-block">
                <a class="layui-btn" href="${ctx}/app/toAdd">新增基础信息</a>
            </div>

        <table class="layui-table">
            <thead>
                <tr>
                    <th>软件名称</th>
                    <th>APK名称</th>
                    <th>软件大小（单位M）</th>
                    <th>所属平台</th>
                    <th>所属分类（一级分类、二级分类、三级分类）</th>
                    <th>状态</th>
                    <th>下载次数</th>
                    <th>最新版本号</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="obj">
                <tr>
                    <td>${obj.softwareName}</td>
                    <td>${obj.apkName}1</td>
                    <td>${obj.softwareSize}</td>
                    <td>
                        <c:if test="${obj.flatformId eq 1}">手机</c:if>
                        <c:if test="${obj.flatformId eq 2}">平板</c:if>
                        <c:if test="${obj.flatformId eq 3}">通用</c:if>
                    </td>
                    <td>
                        ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                    </td>
                    <td>${obj.status}</td>
                    <td>${obj.downloads}</td>
                    <td>${obj.newAppVersion.versionNo}</td>
                    <td>
                        <a href="${ctx}/app/toEdit/${obj.id}" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe642;</i></a>
                        <a href="${ctx}/app/queryById/${obj.id}" class="layui-btn"><i class="layui-icon">&#xe615;</i></a>
                        <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe640;</i></a>
                        ${obj.id}
                    </td>

                </tr>
            </c:forEach>
            <tr>
                <td>
                    共${page.total} 条记录 第/${page.pageNum}/${page.pages}页
                </td>

                <td colspan="8">
                    <a href="javascript:void(0)" page="first">首页</a>
                    <a href="javascript:void(0)" page="prev">上一页</a>
                    <a href="javascript:void(0)" page="next">下一页</a>
                    <a href="javascript:void(0)" page="last">尾页</a>
                </td>
            </tr>
            </tbody>
        </table>
        </div>


    </div>

    <%@include file="/comment/foot.jsp" %>
</div>
<script src="${ctx}/static/plugin/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        //一级分类start------------------------
        form.on('select(level1)',function(){

            var level1Id = $('#level1').val();
            if (level1Id == ''){
                var html = '<option value="">请选择</option>';
                $('#level2').html(html);
                $('#level3').html(html);
                form.render();
                return;
            }else {
                $.ajax({
                    url:'${ctx}/category/queryLevel2ByLevel1/'+level1Id,
                    type:'get',
                    success:function(data){
                        var html = '<option value="">请选择</option>';
                        var len = data.length;
                        var levelTwo = '${appInfoDTO.levelTwo}';
                        for (var i =0 ; i<len ;i++){
                            html+= '<option value="'+data[i].id+'"';
                            if (data[i].id == levelTwo){
                                html+=' selected ';
                            }

                            html+='>'+data[i].categoryName+'</option>'
                        }

                        $('#level2').html(html);
                        form.render();
                    }
                })
            }

        })
        //一级分类end------------------------

        //二级分类start------------------------
        form.on('select(level2)',function(){

            var level2Id = $('#level2').val();
            if (level2Id == ''){
                var html = '<option value="">请选择</option>';
                $('#level3').html(html);
                form.render();
                return;
            }else {
                $.ajax({
                    url:'${ctx}/category/queryLevel3ByLevel2/'+level2Id,
                    type:'get',
                    success:function(data){
                        var html = '<option value="">请选择</option>';
                        var len = data.length;
                        for (var i =0 ; i<len ;i++){
                            html+= '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>'
                        }

                        $('#level3').html(html);
                        form.render();
                    }
                })
            }

        })
        //二级分类end------------------------

        //分页事件start------------------------
        $('a[page]').click(function(){
            var pageNum = 1;
            var currPage = '${page.pageNum}';
            var totalPage = '${page.pages}';
            var v = $(this).attr('page');

            switch (v){
                case 'first':
                    pageNum=1;
                    break;
               case 'prev':
                   pageNum = currPage-1;
                   if (currPage<1)
                       pageNum=1;
                    break;
               case 'next':
                   pageNum = parseInt(currPage)+1;
                   if (currPage>totalPage)
                       pageNum = currPage;
                    break;
               case 'last':
                   pageNum = totalPage;
                    break;
            }
            //更新隐藏域
            $('input[name=pageNum]').val(pageNum);
            //提交表单
            $('form').submit();
        })
        //分页事件end------------------------

        //非手工改变select值的时候验证数据，获取二级三级
        $(function(){
            var levelOne = $('#level1').val();
            if(levelOne != '' && levelOne !=null){
                var levelTwo = '${appInfoDTO.levelTwo}';
                if (levelTwo != null && levelTwo != undefined && levelTwo != ''){

                    $.ajax({
                        url:'${ctx}/category/queryLevel2ByLevel1/'+levelOne,
                        type:'get',
                        success:function(data){
                            var html = '<option value="">请选择</option>';
                            var len = data.length;
                            var levelTwo = '${appInfoDTO.levelTwo}';
                            for (var i =0 ; i<len ;i++){
                                html+= '<option value="'+data[i].id+'"';
                                if (data[i].id == levelTwo){
                                    html+=' selected ';
                                }

                                html+='>'+data[i].categoryName+'</option>'
                            }

                            $('#level2').html(html);
                            form.render();
                        }
                    })
                        var levelThree = '${appInfoDTO.levelThree}';
                    $.ajax({
                        url:'${ctx}/category/queryLevel3ByLevel2/'+levelTwo,
                        type:'get',
                        success:function(data){
                            var html = '<option value="">请选择</option>';
                            var len = data.length;
                            for (var i =0 ; i<len ;i++){
                                html+= '<option value="'+data[i].id+'"';
                                if (data[i].id == levelThree){
                                    html+=' selected ';
                                }

                                html+='>'+data[i].categoryName+'</option>'
                            }

                            $('#level3').html(html);
                            form.render();
                        }
                    })
                }
            }
        })

    });
</script>
</body>
</html>