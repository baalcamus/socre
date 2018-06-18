/*=======================新增路由规则===============================*/
$(function () {
    oTable = $('#example1').dataTable();

    var nEditing = null;

    $('#example1').on('click', 'button.edit', function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];
        if (nEditing !== null && nEditing != nRow) {
            rollbackRow(oTable, nEditing);
            editRow(oTable, nRow);
            nEditing = nRow;
        } else if (nEditing == nRow && this.value == "保存") {
            saveRow(oTable, nEditing);
            nEditing = null;
        } else {
            editRow(oTable, nRow);
            nEditing = nRow;
        }
		return false;
    });

    function editRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        rTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
        rTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
        rTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
        rTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
        rTds[4].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[4] + '">';
		rTds[5].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[5] + '">';
        rTds[6].innerHTML = '<button type="button" class="btn btn-success btn-xs mbs edit" value="保存"><i class="fa fa-check-square-o"></i>&nbsp;保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs mbs cancel" value="取消"><i class="fa fa-times"></i>&nbsp; 取消</button>';
		
		
    }

    function saveRow(oTable, nRow) {
        var rInputs = $('input', nRow);
        oTable.fnUpdate(rInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(rInputs[1].value, nRow, 1, false);
        oTable.fnUpdate(rInputs[2].value, nRow, 2, false);
        oTable.fnUpdate(rInputs[3].value, nRow, 3, false);
        oTable.fnUpdate(rInputs[4].value, nRow, 4, false);
		oTable.fnUpdate(rInputs[5].value, nRow, 5, false);
        oTable.fnUpdate('<button type="button" class="btn btn-default btn-xs mbs edit" value="编辑"><i class="fa fa-edit"></i>&nbsp; 编辑</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs mbs delete"><i class="fa fa-trash-o" value="删除"></i>&nbsp; 删除</button>', nRow, 6, false);
        oTable.fnDraw();
    }

    $('#example1').on('click', 'button.delete', function (e) {
        e.preventDefault();
        if (confirm("Are you sure to delete this row ?") == false) {
            return;
        }
        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
    });
    $('#example1').on('click', 'button.cancel', function (e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        } else {
            rollbackRow(oTable, nEditing);
            nEditing = null;
        }
    });
    function rollbackRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        for (var i = 0, iLen = rTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }
        oTable.fnDraw();
    }
});

/*=======================新增路由规则===============================*/

/*======================代付费率弹窗===============================*/
$(function () {
    oTable = $('#example-feilv').dataTable();

    var nEditing = null;

    $('#example-feilv').on('click', 'button.edit-dg', function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];
        if (nEditing !== null && nEditing != nRow) {
            rollbackRow(oTable, nEditing);
            editRow(oTable, nRow);
            nEditing = nRow;
        } else if (nEditing == nRow && this.value == "保存") {
            saveRow(oTable, nEditing);
            nEditing = null;
        } else {
            editRow(oTable, nRow);
            nEditing = nRow;
        }
		return false;
    });

    function editRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        rTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
        rTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
        rTds[2].innerHTML = '<button type="button" class="btn btn-success btn-xs edit-dg" value="保存"><i class="fa fa-check-square-o"></i>&nbsp;保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs cancel-dg" value="取消"><i class="fa fa-times"></i>&nbsp; 取消</button>';
		
		
    }

    function saveRow(oTable, nRow) {
        var rInputs = $('input', nRow);
        oTable.fnUpdate(rInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(rInputs[1].value, nRow, 1, false);
        oTable.fnUpdate('<button type="button" class="btn btn-default btn-xs edit-dg" value="编辑"><i class="fa fa-edit"></i>&nbsp; 编辑</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs delete-dg"><i class="fa fa-trash-o" value="删除"></i>&nbsp; 删除</button>', nRow, 2, false);
        oTable.fnDraw();
    }

    $('#example-feilv').on('click', 'button.delete-dg', function (e) {
        e.preventDefault();
        if (confirm("Are you sure to delete this row ?") == false) {
            return;
        }
        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
    });
    $('#example-feilv').on('click', 'button.cancel-dg', function (e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        } else {
            rollbackRow(oTable, nEditing);
            nEditing = null;
        }
    });
    function rollbackRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        for (var i = 0, iLen = rTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }
        oTable.fnDraw();
    }
});
/*======================代付费率弹窗===============================*/

/*======================代付费率对私弹窗===============================*/
$(function () {
    oTable = $('#example-duisi').dataTable();

    var nEditing = null;

    $('#example-duisi').on('click', 'button.edit-ds', function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];
        if (nEditing !== null && nEditing != nRow) {
            rollbackRow(oTable, nEditing);
            editRow(oTable, nRow);
            nEditing = nRow;
        } else if (nEditing == nRow && this.value == "保存") {
            saveRow(oTable, nEditing);
            nEditing = null;
        } else {
            editRow(oTable, nRow);
            nEditing = nRow;
        }
		return false;
    });

    function editRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        rTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
        rTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
        rTds[2].innerHTML = '<button type="button" class="btn btn-success btn-xs edit-ds" value="保存"><i class="fa fa-check-square-o"></i>&nbsp;保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs cancel-ds" value="取消"><i class="fa fa-times"></i>&nbsp; 取消</button>';
		
		
    }

    function saveRow(oTable, nRow) {
        var rInputs = $('input', nRow);
        oTable.fnUpdate(rInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(rInputs[1].value, nRow, 1, false);
        oTable.fnUpdate('<button type="button" class="btn btn-default btn-xs edit-ds" value="编辑"><i class="fa fa-edit"></i>&nbsp; 编辑</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-xs delete-ds"><i class="fa fa-trash-o" value="删除"></i>&nbsp; 删除</button>', nRow, 2, false);
        oTable.fnDraw();
    }

    $('#example-duisi').on('click', 'button.delete-ds', function (e) {
        e.preventDefault();
        if (confirm("Are you sure to delete this row ?") == false) {
            return;
        }
        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
    });
    $('#example-duisi').on('click', 'button.cancel-ds', function (e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        } else {
            rollbackRow(oTable, nEditing);
            nEditing = null;
        }
    });
    function rollbackRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var rTds = $('>td', nRow);
        for (var i = 0, iLen = rTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }
        oTable.fnDraw();
    }
});
/*======================代付费率对私弹窗===============================*/


