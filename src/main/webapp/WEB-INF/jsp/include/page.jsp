<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<div id="table_id_wrapper" class="dataTables_wrapper form-inline no-footer">

    <div class="dataTables_length" style="float: left;">
        <label> <%--共 ${page.total } 条记录 |--%> 每页显示： <select id="pageSize" name="table_id_length" aria-controls="table_id" class="form-control input-sm">
            <option value="10" ${page.pageSize eq 10?'selected':'' }>10</option>
            <option value="25" ${page.pageSize eq 25?'selected':'' }>25</option>
            <option value="50" ${page.pageSize eq 50?'selected':'' }>50</option>
            <!-- <option value="-1" ${page.pageSize eq -1?'selected':'' }>All</option>  -->
        </select>
        </label>
    </div>

    <c:if test="${page.pages gt 1}">
        <div class="dataTables_paginate paging_simple_numbers" id="table_id_paginate" style="float: right;">
            <ul class="pagination">
                <li class="paginate_button previous ${page.pageNum eq 1?'disabled':'paginate_button_js' }" data-index="1"><a href="javascript:void(0)">最前</a></li>
                <li class="paginate_button previous ${page.pageNum eq 1?'disabled':'' }" aria-controls="table_id" tabindex="0" id="table_id_previous"><a href="javascript:void(0)">上页</a></li>
                <c:forEach items="${page.navigatepageNums }" var="index">
                    <li class="paginate_button ${page.pageNum eq index?'active':'paginate_button_js' }" aria-controls="table_id" data-index="${index}"><a href="javascript:void(0)">${index }</a></li>
                </c:forEach>
                <li class="paginate_button next ${page.pageNum eq page.pages?'disabled':'' }" aria-controls="table_id" tabindex="0" id="table_id_next"><a href="javascript:void(0)">下页</a></li>
                <li class="paginate_button next ${page.pageNum eq page.pages?'disabled':'paginate_button_js' }" data-index="${page.pages }"><a href="javascript:void(0)">最后</a></li>
                <li class="display_inlineblock paginate_text">跳转到第 <input id="page" type="text" class="form-control input-sm" size="2"> 页
                    <button id="page-forward" type="button" class="btn btn-primary btn-xs">确定</button></li>
            </ul>
        </div>
    </c:if>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var totalPage = Number('${page.pages}');
        var $queryForm = $('#queryForm');

        $queryForm.submit(function(){
            //$queryForm.find('input[name=page]').val($('#page').val());
            $queryForm.find('input[name=pageSize]').val($('#pageSize').val());
        });

        $('#btnSubmit').on('click',function(){
            $queryForm.find('input[name=pageNum]').val(1);
            $queryForm.submit();
        });

        $('#table_id_previous').on('click',function(){
            var page = Number($queryForm.find('input[name=pageNum]').val());
            if(page!=1){
                $queryForm.find('input[name=pageNum]').val(--page);
                $queryForm.submit();
            }
        });

        $('#table_id_next').on('click',function(){
            var page = Number($queryForm.find('input[name=pageNum]').val());
            if((page+1) <= totalPage){
                $queryForm.find('input[name=pageNum]').val(++page);
                $queryForm.submit();
            }
        });

        $('#page-forward').on('click',function(){
            var regPage = /^[1-9]*$/;
            var page = $('#page').val();
            if(!regPage.test(page)||page==""){
                return;
            }
            $queryForm.find('input[name=pageNum]').val($('#page').val());
            $queryForm.submit();
        });

        $('li.paginate_button_js').on('click',function(){
            var page = Number($(this).data('index'));
            $queryForm.find('input[name=pageNum]').val(page);
            $queryForm.submit();
        });

        $('#pageSize').on('change',function(){
            $queryForm.find('input[name=pageNum]').val(1);
            $queryForm.submit();
        });
    })
</script>
<div class="clearfix"></div>