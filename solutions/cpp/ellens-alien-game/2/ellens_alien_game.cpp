namespace targets {
    class Alien {
        public:
            Alien(int x, int y) {
                x_coordinate = x;
                y_coordinate = y;
            }

            bool collision_detection(Alien alien) {
                return alien.x_coordinate == x_coordinate &&
                        alien.y_coordinate == y_coordinate;
            }

            int get_health() {
                return health;
            };

            bool hit() {
                if (health > 0) --health;
                return true;
            }

            bool is_alive() {
                return health > 0;
            }

            bool teleport(int new_x, int new_y) {
                x_coordinate = new_x;
                y_coordinate = new_y;
                return true;
            }

            int x_coordinate{};
            int y_coordinate{};

        private:
            int health{3};
    };
}  // namespace targets
