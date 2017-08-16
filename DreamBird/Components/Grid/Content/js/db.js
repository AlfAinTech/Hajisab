(function() {

    var db = {

        loadData: function (filter) {
            return $.ajax({
                type: "POST",
                url: "../../Components/Grid/LoadTranscript.ashx",
                data: filter,
                dataType: "json"
            });
        },

        insertItem: function (item) {
            return $.ajax({
                type: "POST",
                url: "../../Components/Grid/AddTranscript.ashx",
                data: item,
                dataType: "json"
            });
        },

        updateItem: function (item) {
            return $.ajax({
                type: "POST",
                url: "../../Components/Grid/UpdateTranscript.ashx",
                data: item,
                dataType: "json"
            });
        },

        deleteItem: function (item) {
            return $.ajax({
                type: "POST",
                url: "../../Components/Grid/DeleteTranscript.ashx",
                data: item
            });
        },

    };

    window.db = db;

}());