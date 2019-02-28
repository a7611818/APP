<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${ctx}/static/plugin/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <%@include file="/comment/head.jsp" %>
    <%@include file="/comment/left.jsp" %>

    <div class="layui-body">

        <form action="${ctx}/app/add" class="layui-form">
                <div class="layui-form-item">

                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">Apk名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="apkName" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">支持Rom</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportROM" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input">
                    </div>

                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input">
                    </div>

                </div>

                <div class="layui-form-item">

                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select name="flatform.valueId" lay-filter="aihao">
                            <option value="">请选择</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel1.id" id="level1" lay-filter="level1">
                            <option value="">请选择</option>
                            <c:forEach items="${level1}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label class="layui-form-label">二级分类</label>
                    <div  class="layui-input-inline">
                        <select name="categoryLevel2.id" lay-filter="level2" id="level2">

                        </select>
                    </div>

                    <label class="layui-form-label">三级分类</label>
                    <div  class="layui-input-inline">
                        <select name="categoryLevel3.id" lay-filter="level3" id="level3">

                        </select>
                    </div>

                </div>

                <div class="layui-form-item">

                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="text" name="appInfo" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input">
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>

                </div>

        </form>
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
        form.render();

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
        //二级分类end---------

    });
</script>
</body>
</html>