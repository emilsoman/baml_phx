from deepeval import assert_test
from deepeval.test_case import LLMTestCase, LLMTestCaseParams
from deepeval.metrics import GEval
from baml_client.sync_client import b


def test_correctness():
    correctness_metric = GEval(
        name="Correctness",
        criteria="Determine if the 'actual output' is correct based on the 'expected output'.",
        evaluation_params=[
            LLMTestCaseParams.ACTUAL_OUTPUT,
            LLMTestCaseParams.EXPECTED_OUTPUT,
        ],
        threshold=0.5,
    )

    input = "Hello, world!"
    result = b.Echo(input)

    test_case = LLMTestCase(
        input=input,
        actual_output=result,
        expected_output=input,
    )
    assert_test(test_case, [correctness_metric])
