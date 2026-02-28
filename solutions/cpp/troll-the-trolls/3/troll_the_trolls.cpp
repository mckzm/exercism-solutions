namespace hellmath {
    enum  class AccountStatus {
        guest,
        mod,
        troll,
        user,
    };

    enum class Action {
        read,
        remove,
        write,
    };

    bool display_post(const AccountStatus& poster, const AccountStatus& viewer) {
        switch (poster) {
            case AccountStatus::troll:
                return viewer == AccountStatus::troll;
            default:
                return true;
        }
    }

    bool permission_check(const Action& action, const AccountStatus& player) {
        switch (player) {
            case AccountStatus::guest:
                return action == Action::read;
            case AccountStatus::mod:
                return true;
            case AccountStatus::troll:
            case AccountStatus::user:
                return !(action == Action::remove);
            default:
                return false;
        }
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
            default:
                return false;
        }
    }

    bool has_priority(const AccountStatus& player1, const AccountStatus& player2) {
        switch (player1) {
            case AccountStatus::troll:
                return false;
            case AccountStatus::guest:
                return player2 == AccountStatus::troll;
            case AccountStatus::user:
                return (player2 == AccountStatus::guest || player2 == AccountStatus::troll);
            case AccountStatus::mod:
                return player2 != AccountStatus::mod;
            default:
                return false;
        }
    }
}  // namespace hellmath
