enum TopUpUiStates {

    none,
  networkIssue,
  genericError,
  // some network
  failedTransaction,
  sessionExpired,
  noEnoughBalance,
  successfulTransaction,
  alreadyReachedMonthlyThresholdNonVerifiedUser,
  reachedMonthlyThresholdNonVerifiedUser, // for non verified user who reached the 500 threshold per month per user
  ;
}
