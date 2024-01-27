class AuraCalculator {
  constructor(initialAura = 0) {
    this.aura = initialAura;
  }

  postOnSocialMedia() {
    this.aura += 1;
  }

  likeOnSocialMedia() {
    this.aura += 0.5;
  }

  commentOnSocialMedia() {
    this.aura += 0.5;
  }

  completeIndividualQuest() {
    this.aura += 0.1;
  }

  completeCommunityQuest() {
    this.aura += 0.3;
  }

  receiveDislike() {
    this.aura -= 0.2; // Decrease aura by 0.5 for each dislike received
  }

  missLogin() {
    this.aura -= 1; // Decrease aura by 1 for each missed login
  }

  getAura() {
    return this.aura;
  }
}
module.exports = AuraCalculator;
