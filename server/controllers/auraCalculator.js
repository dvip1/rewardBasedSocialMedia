class AuraCalculator {
  constructor(initialAura = 0, xpConfig = null) {
    this.aura = initialAura;
    this.streakDays = 0;

    // Default XP configuratio
    this.xpConfig = xpConfig || {
      multipliers: [1.0, 1.0, 1.5, 2.0, 2.5, 3.0],
      bonusXp: 1000,
    };
  }
  /* Social Media */
  postOnSocialMedia() {
    this.aura += 1;
  }
  likeOnSocialMedia() {
    this.aura += 0.5;
  }
  commentOnSocialMedia() {
    this.aura += 0.5;
  }
  receiveDislike() {
    this.aura -= 0.5;
  }
  missLogin() {
    this.aura -= 1; // Decrease aura by 1 for each missed login
  }

  /* Complete Quest */
  completeIndividualQuest() {
    this.aura += 0.1;
  }

  completeCommunityQuest() {
    this.aura += 0.3;
  }
  /* Get Methods */
  getAura() {
    return this.aura;
  }
  getStreakDays() {
    return this.streakDays;
  }
  /* Set Method */
  updateStreakDays(days) {
    this.streakDays = days;
  }
  /* Reset Method */
  reset() {
    this.streakDays = 0;
  }
  /* Calculate Aura */
  calculateAuraXp() {
    const { multipliers, bonusXp } = this.xpConfig;
    const maxDays = multipliers.length * 5;

    let multiplier = 1.0;
    if (this.streakDays >= 1 && this.streakDays <= maxDays) {
      multiplier = multipliers[Math.floor((this.streakDays - 1) / 5)];
    } else if (this.streakDays === maxDays + 1) {
      return bonusXp; // 30-day bonus
    }

    return this.aura * multiplier;
  }
}

module.exports = AuraCalculator;
