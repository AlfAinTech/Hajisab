jQuery(document).ready(function ($) {
    $(document).on('click', '#Edit_Question_ordinary', function (e) {
        e.preventDefault();
        $(this).parent().css("display", "none");
        $('#inline_edit').css("display", "block");
        $('#QuestionText1').val($('#QuestionText').text());
        $('#QuestionText').parent().css("display", "none");

    });
    $(document).on('click', '.remove', function () {
        $(this).parent().parent().remove();
    });
    $(document).on('change', '.qopts', function () {

    });
    $(document).on('click', '.edit', function () {
        $('#text').collapse('show');
        var current_id = $(this).data("edit");
        $('#fib_text').val($('#span_' + current_id).text());
        $('#current_id').val('#span_' + current_id);
        $('#fib_text').focus();
    });
    $(document).on('click', '#add_text', function (e) {
        e.preventDefault();
        if ($('#current_id').val() == "new") {
            var ExistingTexts = $('.mfib').length + 1;

            var EnteredContent = $('#fib_text').val();
            if (EnteredContent.length == 0) {
                alert("Enter text in the text field");
            }
            else {
                var stringToEnter = "<div class='col-md-3' data-type='Text' data-component='" + ExistingTexts + "'><div class='col-md-10'><span class='mfib' id='span_" + ExistingTexts + "'>" + EnteredContent + "</span></div><div class='col-md-2'><span class='glyphicon glyphicon-pencil edit' data-edit='" + ExistingTexts + "' aria-hidden='true'></span><span class='glyphicon glyphicon-remove remove' aria-hidden='true'></span></div>";
                $('#mfib').append(stringToEnter);
            }
        }
        else {
            var id = $('#current_id').val();
            $(id).text($('#fib_text').val())
        }
        $('#current_id').val("new");
    });
    $(document).on('click', '.fedit', function () {
        var contributing_id = $(this).data("edit");
        $('#blank').collapse('show');
        $('#text_blank').val($('#blank_' + contributing_id).text());
        $('#weightate_blank').val($('#weightage_' + contributing_id).text());
        $('#current_id_blank').val(contributing_id);
    });
    $(document).on('click', '#add_blank', function (e) {
        e.preventDefault();
        if ($('#current_id_blank').val() == "new") {
            var ExistingTexts = $('.mfib').length + 1;
            var Weightage = $('#weightate_blank').val();
            var EnteredContent = $('#text_blank').val();
            if (EnteredContent.length == 0) {
                alert("Enter text in the text field");
            }
            else {
                var stringToEnter = "<div class='col-md-3' data-type='Blank' data-component='" + ExistingTexts + "'><div class='col-md-8'><span class='mfib' id='blank_" + ExistingTexts + "'>" + EnteredContent + "</span></div><div class='col-md-2'><span data-weightage='" + Weightage + "' id='weightage_" + ExistingTexts + "'>" + Weightage + "</span></div><div class='col-md-2'><span class='glyphicon glyphicon-pencil fedit' data-edit='" + ExistingTexts + "' aria-hidden='true'></span><span class='glyphicon glyphicon-remove remove' aria-hidden='true'></span></div>";
                $('#mfib').append(stringToEnter);
            }
        }
        else {
            var id = $('#current_id_blank').val();
            $('#blank_' + id).text($('#text_blank').val());
            $('#weightage_' + id).text($('#weightate_blank').val());
            $('#weightage_' + id).attr("data-weightage", $('#weightate_blank').val());
        }
        $('#current_id_blank').val("new");
    });
    $(document).on('click', '#save_mfib_question', function (e) {
        e.preventDefault();
        var content = $('#mfib').html();
        if (content.length == 10) {
            alert("Enter question content to save the question");
        }
        else {
            var content = $("#mfib").html();
            var catid = $('#ddl_cat').val();
            var subcatid = $('#ddl_sub_cat').val();
            var level = $('#ddl_btax').val();
            var qid = $('#QuestionIdentifier').val();
            var url = "../../Components/QuestionBank/Content/MultipleFIBHandler.ashx?Type=MultipleFIB&&QID=" + qid + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: content,
                success: function (result) {
                    alert("Question Saved Successfully");
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });

        }
    });

    $(document).on('click', '#remove_question_fib', function (e) {
        e.preventDefault();
        var type = $('#QuestionType').val();
        var QID = $('#QuestionIdentifier').val();
        alert(type);
        var url = "../../Components/QuestionBank/Content/FillInBlankHandler.ashx?Purpose=RemoveQuestion&&Type=" + type + "&&QID=" + QID;
        $.ajax({
            url: url,
            type: "POST",
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result);
                window.close();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
    $(document).on('click', '#remove_question', function (e) {
        e.preventDefault();
        var type = $('#QuestionType').val();
        var QID = $('#QuestionIdentifier').val();
        var url = "../../Components/QuestionBank/Content/MCQHandler.ashx?Purpose=RemoveQuestion&&Type=" + type + "&&QID=" + QID;
        $.ajax({
            url: url,
            type: "POST",
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result);
                window.close();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
    $(document).on('click', '#inline_option_text', function (e) {
        e.preventDefault();
        var QID = $('#QuestionIdentifier').val();
        var Text = $('#inline_add_options').val();
        if (Text.length == 0) {
            alert("Enter the Option Text before saving");
            $('#inline_add_options').focus();
        }
        else {
            var url = "../../Components/QuestionBank/Content/js/InlineSaver.ashx?QID=" + QID + "&&Request_type=" + "AddOption";
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: Text,
                success: function (result) {
                    $('#refresh_options').click();
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }

    });
    $(document).on('click', '#cancel_inline', function (e) {
        e.preventDefault();
        $('#Edit_Question_ordinary').parent().css("display", "block");
        $('#inline_edit').css("display", "none");
        $('#QuestionText').parent().css("display", "block");
    });
    $('#mcqEditor').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('purpose'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        if (recipient == "AddNewQuestion") {
            modal.find('.modal-title').text('Add Question Text');
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "editQuestionText") {
            modal.find('.modal-title').text('Edit Question Text');
            CKEDITOR.instances[$('#Hf1').val()].setData($('#QuestionText').html());
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "editFIBQuestionText") {
            modal.find('.modal-title').text('Edit Question Text');
            CKEDITOR.instances[$('#Hf1').val()].setData($('#QuestionText').html());
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "AddMCQOption") {
            modal.find('.modal-title').text('Add MCQ Option');
            CKEDITOR.instances[$('#Hf1').val()].setData("");
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "editOptionText") {
            modal.find('.modal-title').text('Edit MCQ Option');
            var optid = button.data("opid");
            $('#OptionIdentifier').val(optid);
            var text = $('span[data-textid=' + optid + ']').text();
            CKEDITOR.instances[$('#Hf1').val()].setData(text);
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "AddNewFIBQuestion") {
            modal.find('.modal-title').text('Add Question Text');
            $('#QuestionType').val("FillInBlanks");
        }
        else if (recipient == "AddHint") {
            modal.find('.modal-title').text('Add Hint Text');
            $('#QuestionType').val("AddHintText");
            CKEDITOR.instances[$('#Hf1').val()].setData($('#HintText').html());
        }
        else if (recipient == "addExplanation") {
            modal.find('.modal-title').text('Add Explanation');
            $('#QuestionType').val("AddExplanationText");
            CKEDITOR.instances[$('#Hf1').val()].setData($('#ExplanationText').html());
        }

        //modal.find('.modal-body input').val(recipient);
        $('#HiddenEditor').val(recipient);
    });
    $('#GroupQuestionEditor').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('purpose'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        if (recipient == "AddNewQuestion") {
            modal.find('.modal-title').text('Add Question Text');
            $('#QuestionType').val("GroupQuestions")
        }
        else if (recipient == "editQuestionText") {
            modal.find('.modal-title').text('Edit Question Text');
            CKEDITOR.instances[$('#Hf1').val()].setData($('#QuestionText').html());
            $('#QuestionType').val("GroupQuestions")
        }
        //modal.find('.modal-body input').val(recipient);
        $('#HiddenEditor').val(recipient);
    });
    $('#FIBEditor').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('purpose'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        if (recipient == "editFIBQuestionText") {
            modal.find('.modal-title').text('Edit Question Text');
            CKEDITOR.instances[$('#Hf1').val()].setData($('#QuestionText').html());
            $('#QuestionType').val("MCQ's")
        }
        else if (recipient == "AddNewFIBQuestion") {
            modal.find('.modal-title').text('Add Question Text');
            $('#QuestionType').val("FillInBlanks");
        }
        else if (recipient == "AddHint") {
            modal.find('.modal-title').text('Add Hint Text');
            $('#QuestionType').val("AddHintText");
            CKEDITOR.instances[$('#Hf1').val()].setData($('#HintText').html());
        }


        //modal.find('.modal-body input').val(recipient);
        $('#HiddenEditor').val(recipient);
    });
    $(document).on('click', '.inline_option_cancel', function (e) {
        e.preventDefault();
        var id = $(this).attr("data-opid");
        $('span[data-textid=' + id + ']').parent().css("display", "block");
        $('#edit-option-' + id + '').css("display", "none");
    });
    $(document).on('click', '.inline_edit', function (e) {
        e.preventDefault();
        var id = $(this).attr("data-opid");
        $('input[data-textidinline=' + id + ']').val($('span[data-textid=' + id + ']').text());
        $('span[data-textid=' + id + ']').parent().css("display", "none");
        $('#edit-option-' + id + '').css("display", "block");

    });
    $(document).on('click', '.inline_option_save', function () {
        var OpID = $(this).attr("data-opid");
        var QID = $('#QuestionIdentifier').val();
        var Text = $('input[data-textidinline=' + OpID + ']').val();
        if (Text == "") {
            alert("Field cannot be empty");
            $('input[data-textidinline=' + OpID + ']').focus();
        }
        else {
            var url = "../../Components/QuestionBank/Content/js/InlineSaver.ashx?QID=" + QID + "&&Request_type=" + "Option&&OPID=" + OpID;
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: Text,
                success: function (result) {
                    $('span[data-textid=' + OpID + ']').text(result);
                    $('span[data-textid=' + OpID + ']').parent().css("display", "block");
                    $('#edit-option-' + OpID + '').css("display", "none");
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }

    });
    $(document).on('click', '#Select_group_Questions', function (e) {
        e.preventDefault();
        $('#QuestionGroupRepeater').css("display", "block");
    });
    $(document).on('click', '#save_inline', function () {
        var QID = $('#QuestionText1').attr("qid");
        var QuestionText = $('#QuestionText1').val();
        var url = "../../Components/QuestionBank/Content/js/InlineSaver.ashx?QID=" + QID + "&&Request_type=" + "Question";
        $.ajax({
            url: url,
            type: "POST",
            contentType: false,
            processData: false,
            data: QuestionText,
            success: function (result) {
                $('#Edit_Question_ordinary').parent().css("display", "block");
                $('#inline_edit').css("display", "none");
                $('#QuestionText').parent().css("display", "block");
                $('#QuestionText').html(result);
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });

    $(document).on('click', '#cmdSave', function (e) {
        e.preventDefault();
        var purpose = $('#HiddenEditor').val();
        setValue($('#Hf1').val(), '#HiddenField1');
        var content = $('#HiddenField1').val();
        //alert(content);
        if (content == "") {
            alert("Empty content cannot be saved");
        }
        else {
            var qid = $('#QuestionIdentifier').val();

            var optid = $('#OptionIdentifier').val();
            var catid = $('#ddl_cat').val();
            var subcatid = $('#ddl_sub_cat').val();
            var level = $('#ddl_btax').val();
            var type = $('#QuestionType').val();
            var url = "";
            if (qid.length > 0) {
                url = "../../Components/QuestionBank/Content/MCQHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&QID=" + qid + "&&OPTID=" + optid + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            else {
                url = "../../Components/QuestionBank/Content/MCQHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: content,
                success: function (result) {
                    var arr = result.split('|');
                    if (purpose == "AddNewQuestion") {
                        $('#QuestionIdentifier').val(arr[0])
                        $('#QuestionText').html(arr[1]);
                        $('#question_pan').css("display", "block");
                        $('#addQuestion').css("display", "none");
                    }
                    else if (purpose == "editQuestionText") {
                        $('#Edit_Question_ordinary').parent().css("display", "block");
                        $('#inline_edit').css("display", "none");
                        $('#QuestionText').parent().css("display", "block");
                        $('#QuestionText').html(arr[1]);
                    }
                    else if (purpose == "AddMCQOption" || purpose == "editOptionText") {
                        $('#refresh_options').click();
                    }
                    else if (purpose == "AddHint") {
                        $("#HintText").html(arr[1]);
                    }
                    else if (purpose == "addExplanation") {
                        $("#ExplanationText").html(arr[1]);
                    }
                    alert("Successfully Saved");
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }

    });

    $(document).on('click', '#cmdGQSave', function (e) {
        e.preventDefault();
        var purpose = $('#HiddenEditor').val();
        setValue($('#Hf1').val(), '#HiddenField1');
        var content = $('#HiddenField1').val();
        //alert(content);
        if (content == "") {
            alert("Empty content cannot be saved");
        }
        else {
            var qid = $('#QuestionIdentifier').val();

            var optid = $('#OptionIdentifier').val();
            var catid = $('#ddl_cat').val();
            var subcatid = $('#ddl_sub_cat').val();
            var level = $('#ddl_btax').val();
            var type = $('#QuestionType').val();
            var url = "";
            if (qid.length > 0) {
                url = "../../Components/QuestionBank/GroupQuestionsHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&QID=" + qid + "&&OPTID=" + optid + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            else {
                url = "../../Components/QuestionBank/GroupQuestionsHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: content,
                success: function (result) {
                    var arr = result.split('|');
                    if (purpose == "AddNewQuestion") {
                        $('#QuestionIdentifier').val(arr[0])
                        $('#QuestionText').html(arr[1]);
                        $('#question_pan').css("display", "block");
                        $('#addQuestion').css("display", "none");
                    }
                    else if (purpose == "editQuestionText") {
                        $('#Edit_Question_ordinary').parent().css("display", "block");
                        $('#inline_edit').css("display", "none");
                        $('#QuestionText').parent().css("display", "block");
                        $('#QuestionText').html(arr[1]);
                    }
                    alert("Successfully Saved");
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }

    });

    $(document).on('click', '#cmdSaveFIB', function (e) {
        e.preventDefault();
        var content = $('#HiddenField1').val();
        if (content == "") {
            alert("Empty Content cannot be saved");
        }
        else {
            setValue($('#Hf1').val(), '#HiddenField1');
            var qid = $('#QuestionIdentifier').val();
            var purpose = $('#HiddenEditor').val();

            var optid = $('#OptionIdentifier').val();
            var catid = $('#ddl_cat').val();
            var subcatid = $('#ddl_sub_cat').val();
            var level = $('#ddl_btax').val();
            var type = $('#QuestionType').val();
            var url = "";
            if (qid.length > 0) {
                url = "../../Components/QuestionBank/Content/FillInBlankHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&QID=" + qid + "&&OPTID=" + optid + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            else {
                url = "../../Components/QuestionBank/Content/FillInBlankHandler.ashx?Purpose=" + purpose + "&&Type=" + type + "&&CatID=" + catid + "&&SubCatID=" + subcatid + "&&Level=" + level;
            }
            e.preventDefault();
            $.ajax({
                url: url,
                type: "POST",
                contentType: false,
                processData: false,
                data: content,
                success: function (result) {
                    var arr = result.split('|');
                    if (purpose == "AddNewFIBQuestion") {
                        $('#QuestionIdentifier').val(arr[0])
                        $('#QuestionText').html(arr[1]);
                        $('#question_pan').css("display", "block");
                        $('#addQuestion').css("display", "none");
                    }
                    else if (purpose == "editFIBQuestionText") {
                        $('#Edit_Question_ordinary').parent().css("display", "block");
                        $('#inline_edit').css("display", "none");
                        $('#QuestionText').parent().css("display", "block");
                        $('#QuestionText').html(arr[1]);
                    }
                    else if (purpose == "AddHint") {
                        $("#HintText").html(arr[1]);
                    }
                    alert("Successfully Saved");
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
});