$(function() {
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{y: '研发部',a: '4',},{y: '系统运维部',a: '1',},],
        xkey: 'y',
        ykeys: ['a', ],
        labels: ['次数', ],
        hideHover: 'auto',
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart-1',
        data: [{
            y: '普通上线',
            a: 10,
        }, {
            y: '紧急上线',
            a: 5,
        }, ],
        xkey: 'y',
        ykeys: ['a',],
        labels: ['次数',],
        hideHover: 'auto',
        resize: true
    });

});
