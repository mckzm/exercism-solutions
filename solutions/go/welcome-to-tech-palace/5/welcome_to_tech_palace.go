// Package techpalace provides tools to build marketing messages
// to be shown at the entrance of the Tech Palace appliance store.
package techpalace

import "strings"
import "fmt"


const (
    // welcomeGreeting is the base template for welcome messages
    // displayed to customers.
    welcomeGreeting = "Welcome to the Tech Palace, "
    // borderedWelcomeTemplate is the [fmt.Sprintf] format string
    // for bordered welcome messages.
    borderedWelcomeTemplate = "%s\n%s\n%s"
)

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return welcomeGreeting + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	border := strings.Repeat("*", numStarsPerLine)
    return fmt.Sprintf(borderedWelcomeTemplate, border, welcomeMsg, border)
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	starLess := removeStars(oldMsg)
    return strings.TrimSpace(starLess)
}

func removeStars(msg string) string {
    return strings.ReplaceAll(msg, "*", "")
}
