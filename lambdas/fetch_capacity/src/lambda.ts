import { Handler } from "aws-lambda"

export const handler: Handler = async (event, context) => {
  console.log("EVENT: \n" + JSON.stringify(event, null, 2))
  console.log(`Context: ${JSON.stringify(context)}`)
  return context.logStreamName
}
