using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HelpPanelScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        this.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    // used by HelpButton to make panel appear
    public void SetActive(bool state)
    {
        this.gameObject.SetActive(state);
    }
}
