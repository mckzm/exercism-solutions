namespace hellmath {
    enum  class AccountStatus {
        troll,
        guest,
        user,
        mod,
    };

    enum class Action {
        read,
        write,
        remove,
    };

    bool display_post(const AccountStatus& poster, const AccountStatus& viewer) {
        if (poster == AccountStatus::troll) return viewer == AccountStatus::troll;
        return true;
    }

    bool permission_check(const Action& action, const AccountStatus& player) {
        switch (player) {
            case AccountStatus::guest:
                return action == Action::read;
            case AccountStatus::mod:
                return true;
            case AccountStatus::troll:
            case AccountStatus::user:
                return action != Action::remove;
        }

        return false;
    }

    bool valid_player_combination(const AccountStatus& player1, const AccountStatus& player2) {
        switch (player1) {
            case AccountStatus::guest:
                return false;
            case AccountStatus::troll:
                return player2 == AccountStatus::troll;
            case AccountStatus::mod:
            case AccountStatus::user:
                return !(player2 == AccountStatus::guest || player2 == AccountStatus::troll);
        }

        return false;
    }

    bool has_priority(const AccountStatus& player1, const AccountStatus& player2) {
        return player1 > player2;
    }
}  // namespace hellmath
