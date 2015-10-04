predictions = [];
pred_history = [];

$(function() {
	if ($(".bracket").data("editable")) {
		makeTeamsClickable();
		$("[data-target=bracket-submit]").click(submitBracket);
		$("[data-target=bracket-undo]").click(undo);
		$("[data-target=bracket-reset]").click(reset);
		$("[data-target=bracket-randomize]").click(randomize);
	}
});

function makeTeamsClickable() {
	$(".round0 .team").each(function(i, el) {
		addClickable($(el));
	});
}

function undo() {
	if (pred_history.length === 0) {
		return false; // nothing to undo
	}
	e = pred_history.pop();
	if (e.action === "click" ) {
		// get the team and the winner
		var team;
		var winner;
		if (e.slot !== undefined) {
			team = $("[data-slot=" + e.slot + "]").first();
		} else {
			team = $("[data-starting-slot=" + e.starting_slot + "]").first();
		}
		sibling = getSibling(team);
		win_slot = getWinnerSlot(team);
		winner = $("#winner-of-" + win_slot);

		// blank out winner text
		setId(winner, "");
		setName(winner, "");
		setSeed(winner, "");

		// remove from predictions list
		predictions[parseInt(win_slot)] = undefined;

		// update clickability
		removeClickable(winner);
		removeClickable(getSibling(winner));
		addClickable(team);
		addClickable(sibling);
	}
}

function reset() {
	pred_history = [];
	predictions = [];

	$(".round0 .team").each(function(i, el) {
		addClickable($(el));
	});

	$(".round1 .team, .round2 .team, .round3 .team, .round4 .team, .final-four .team").each(function(i, el) {
		team = $(el);
		removeClickable(team);
		setId(team, "");
		setName(team, "");
		setSeed(team, "");
	});
}

function randomize() {
	// reset first
	reset();

	// rounds 0-3
	$(".round0 .game").each(function(i, el) {
		rand = Math.round(Math.random());
		if (rand === 0) {
			$(el).find(".team1").click();
		} else {
			$(el).find(".team2").click();
		}
	});
	$(".round1 .game").each(function(i, el) {
		rand = Math.round(Math.random());
		if (rand === 0) {
			$(el).find(".team1").click();
		} else {
			$(el).find(".team2").click();
		}
	});
	$(".round2 .game").each(function(i, el) {
		rand = Math.round(Math.random());
		if (rand === 0) {
			$(el).find(".team1").click();
		} else {
			$(el).find(".team2").click();
		}
	});
	$(".round3 .game").each(function(i, el) {
		rand = Math.round(Math.random());
		if (rand === 0) {
			$(el).find(".team1").click();
		} else {
			$(el).find(".team2").click();
		}
	});

	// final four
	rand = Math.round(Math.random());
	if (rand === 0) {
		$("#winner-of-56").click();
	} else {
		$("#winner-of-57").click();
	}
	rand = Math.round(Math.random());
	if (rand === 0) {
		$("#winner-of-58").click();
	} else {
		$("#winner-of-59").click();
	}
	rand = Math.round(Math.random());
	if (rand === 0) {
		$("#winner-of-60").click();
	} else {
		$("#winner-of-61").click();
	}
}

var advanceTeam = function(e){
	// fade the notice
	$(".bracket-error").fadeOut(function() {
		$(".bracket-error").addClass("hidden");
		$(".bracket-error").show();
	})

	// get some information about what was clicked
	team = $(this);
	id = getId(team);
	name = getName(team);
	seed = getSeed(team);
	slot = getSlot(team);
	win_slot = getWinnerSlot(team);
	
	// find and update winner slot
	winner = $("#winner-of-" + win_slot);
	setId(winner, id);
	setName(winner, name);
	setSeed(winner, seed);
	predictions[parseInt(win_slot)] = id;

	// find sibling
	sibling = getSibling(team);

	// update clickability
	removeClickable($(this));
	if (getSibling(winner) && getName(getSibling(winner)) !== "") {
		addClickable(winner);
		addClickable(getSibling(winner));
	}
	if (getName(sibling) !== "") {
		removeClickable(sibling);
	}

	// add to history
	start = team.data("starting-slot");
	pred_history.push({action: "click", slot: slot, to: win_slot, starting_slot: start});
};

function submitBracket() {
	if (verifyBracket()) {
		$(".bracket-error").addClass("hidden");
		$("#new_bracket input[name='bracket[predictions]']").val(JSON.stringify(predictions));
		$("#new_bracket").submit();
	} else {
		$(".bracket-error").removeClass("hidden");
	}
	return false;
}

function verifyBracket() {
	if (predictions.length != 63) {
		return false;
	} else {
		for (i = 0; i++; i<predictions.length) {
			if (predictions[i] === undefined) {
				return false;
			}
		}
	}
	return true;
}

function addClickable(e) {
	e.addClass("team-clickable");
	e.unbind("click").click(advanceTeam);
}

function removeClickable(e) {
	e.removeClass("team-clickable");
	e.unbind("click");
}

function getId(e) {
	return e.data("team-id");
}

function getName(e) {
	return $.trim(e.find(".team-name").text());
}

function getSeed(e) {
	return $.trim(e.find(".seed").text());
}

function getSlot(e) {
	return e.data("slot");
}

function getWinnerSlot(e) {
	s = e.data("winner-to");
	if (s === undefined) {
		// if the team doesn't have the data-winner-to attr,
		// the parent game element should
		s = e.closest(".game").data("winner-to");
	}
	return s;
}

function getSibling(e) {
	s = e.siblings(".team");
	if (s.length === 0) {
		// special case for final four games
		sibling_slot = e.data("opponent-slot");
		s = $("#winner-of-" + sibling_slot);
	}
	return s;
}

function setId(e, id) {
	e.data("team-id", id);
}

function setName(e, name) {
	return e.find(".team-name").text(name);
}

function setSeed(e, seed) {
	return e.find(".seed").text(seed);
}

