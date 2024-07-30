enum TopUpUiStates {
  none,
  networkIssue,
  genericError,
  // some network
  failedTransaction,
  sessionExpired,
  noEnoughBalance,
  successfulTransaction,
  alreadyReachedMonthlyThresholdVerifiedUser,
  reachedMonthlyThresholdVerifiedUser,
  alreadyReachedMonthlyThresholdNonVerifiedUser,
  reachedMonthlyThresholdNonVerifiedUser, // for non verified user who reached the 500 threshold per month per user
  reachedMonthlyTopUpThreshold, // this is the sum of all topups done in a month
  ;
}
