resource "aws_iam_account_password_policy" "strict_policy" {
  minimum_password_length        = 12
  require_numbers                = true
  require_symbols                = true
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  allow_users_to_change_password = true
}

resource "aws_iam_policy" "mfa_enforcement" {
  name   = "MFAEnforcement"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Deny"
      Action   = "*"
      Resource = "*"
      Condition = {
        Bool = {
          "aws:MultiFactorAuthPresent" = "false"
        }
      }
    }]
  })
}

resource "aws_iam_group_policy_attachment" "mfa_attach" {
  group      = "Developers"
  policy_arn = aws_iam_policy.mfa_enforcement.arn
}
